import 'dart:async';
import 'dart:developer';

import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:chatting_app/features/messages/domain/usecases/add_reaction_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/delete_message_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/delete_reaction_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/get_around_context_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/get_pinned_messages_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/load_messages_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/pin_message_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/search_messages_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/send_message_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/unpin_message_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/update_message_usecase.dart';
import 'package:chatting_app/features/messages/presentation/cubit/state.dart';
import 'package:chatting_app/features/messages/utils.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../app/utils/app_utils.dart';
import '../../../../core/websocket/events/events.dart';
import '../../data/socket/messages_socket_service.dart';

enum MessagesListStatus { list, aroundContext }

@lazySingleton
class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit(
    this._loadMessagesUseCase,
    this._sendMessageUseCase,
    this._deleteMessageUseCase,
    this._addReactionUseCase,
    this._deleteReactionUseCase,
    this._updateMessageUseCase,
    this._pinMessageUseCase,
    this._unpinMessageUseCase,
    this._getPinnedMessagesUseCase,
    this._messagesSocketService,
    this._getAroundContextUseCase,
    this._searchMessagesUseCase,
  ) : super(const MessagesState()) {
    _subscribeSocketEvents();
  }

  final LoadMessagesUseCase _loadMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final DeleteMessageUseCase _deleteMessageUseCase;
  final AddReactionUseCase _addReactionUseCase;
  final DeleteReactionUseCase _deleteReactionUseCase;
  final UpdateMessageUseCase _updateMessageUseCase;
  final PinMessageUseCase _pinMessageUseCase;
  final UnpinMessageUseCase _unpinMessageUseCase;
  final GetPinnedMessagesUseCase _getPinnedMessagesUseCase;
  final GetAroundContextUseCase _getAroundContextUseCase;
  final SearchMessagesUseCase _searchMessagesUseCase;

  final MessagesSocketService _messagesSocketService;

  final List<StreamSubscription> _subscriptions = [];

  void _subscribeSocketEvents() {
    _subscriptions.addAll([
      _messagesSocketService.messageCreated.listen(
        (event) async => _onMessageCreated(event),
      ),
      _messagesSocketService.messageUpdated.listen(
        (event) async => _onMessageUpdated(event),
      ),
      _messagesSocketService.messageDeleted.listen(
        (event) async => _onMessageDeleted(event),
      ),
      _messagesSocketService.messageRead.listen(
        (event) async => _onMessageRead(event),
      ),
      _messagesSocketService.reactionUpdated.listen(
        (event) async => _onReactionUpdated(event),
      ),

      _messagesSocketService.messagePinned.listen(
        (event) async => _onMessagePinned(event),
      ),
      _messagesSocketService.messageUnpinned.listen(
        (event) async => _onMessageUnpinned(event),
      ),
    ]);
  }

  @override
  Future<void> close() async {
    log('MessagesCubit closed: ${identityHashCode(this)}');

    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }

    return super.close();
  }

  Future<void> _onMessageCreated(MessageCreatedSocketEvent event) async {
    await loadMessages(chatId: event.message.chatId);
  }

  void _onMessageUpdated(MessageUpdatedSocketEvent event) async {
    await loadMessages(chatId: event.message.chatId);
  }

  void _onMessageDeleted(MessageDeletedSocketEvent event) async {
    await loadMessages(chatId: event.message.chatId);
  }

  void _onMessageRead(MessageReadSocketEvent event) async {
    await loadMessages(chatId: event.chatId);
  }

  void _onReactionUpdated(ReactionUpdatedSocketEvent event) async {
    await loadMessages(chatId: event.message.chatId);
  }

  Future<void> _onMessagePinned(MessagePinnedSocketEvent event) async {
    await getPinnedMessages(chatId: event.message.chatId);
  }

  Future<void> _onMessageUnpinned(MessageUnpinnedSocketEvent event) async {
    await getPinnedMessages(chatId: event.message.chatId);
  }

  Future<void> loadMessages({
    bool loadSilent = true,
    required String chatId,
  }) async {
    final isChatTheSame =
        (state.messagesPageEntity?.messages.isNotEmpty ?? false) &&
        state.messagesPageEntity?.messages.first.chatId == chatId;
    emit(
      state.copyWith(
        isLoading: !isChatTheSame || !loadSilent,
        error: null,
        status: MessagesListStatus.list,
      ),
    );
    final result = await _loadMessagesUseCase(
      LoadMessagesParams(chatId: chatId),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            status: MessagesListStatus.list,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            isLoading: false,
            messagesPageEntity: r,
            status: MessagesListStatus.list,
          ),
        );
      },
    );
  }

  Future<void> searchMessages({
    required String chatId,
    required String query,
  }) async {
    final result = await _searchMessagesUseCase(
      SearchMessagesParams(chatId: chatId, query: query),
    );
    result.fold(
      (l) {
        emit(state.copyWith(error: AppUtils.parseFailureMessage(l)));
      },
      (r) {
        emit(state.copyWith(searchResults: r));
      },
    );
  }

  Future<void> loadOlderMessages(String chatId) async {
    if (state.showOlderLoader ||
        !state.messagesPageEntity!.hasPrevious ||
        state.showNewerLoader ||
        state.shouldScroll) {
      return;
    }

    emit(state.copyWith(showOlderLoader: true));

    final result = await _loadMessagesUseCase(
      LoadMessagesParams(
        chatId: chatId,
        beforeMessageId: state.messagesPageEntity?.messages.last.id.toString(),
      ),
    );

    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            showOlderLoader: false,
          ),
        );
      },
      (r) {
        if (r.messages.isEmpty) {
          emit(state.copyWith(showOlderLoader: false));
          return;
        }

        final existingIds = state.messagesPageEntity!.messages
            .map((e) => e.id)
            .toSet();

        final messages = MessagesUtils.mergeMessages(
          state.messagesPageEntity!.messages,
          r.messages.where((m) => !existingIds.contains(m.id)).toList(),
        );

        emit(
          state.copyWith(
            messagesPageEntity: state.messagesPageEntity?.copyWith(
              messages: messages,
            ),
            showOlderLoader: false,
          ),
        );
      },
    );
  }

  Future<void> loadNewerMessages(String chatId) async {
    if (state.showNewerLoader ||
        !state.messagesPageEntity!.hasNext ||
        state.showOlderLoader ||
        state.shouldScroll) {
      return;
    }

    emit(state.copyWith(showNewerLoader: true));

    final result = await _loadMessagesUseCase(
      LoadMessagesParams(
        chatId: chatId,
        afterMessageId: state.messagesPageEntity?.messages.first.id.toString(),
      ),
    );

    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            showNewerLoader: false,
          ),
        );
      },
      (r) {
        if (r.messages.isEmpty) {
          emit(state.copyWith(showNewerLoader: false));
          return;
        }

        final existingIds = state.messagesPageEntity!.messages
            .map((e) => e.id)
            .toSet();

        final messages = MessagesUtils.mergeMessages(
          state.messagesPageEntity!.messages,
          r.messages.where((m) => !existingIds.contains(m.id)).toList(),
        );

        emit(
          state.copyWith(
            messagesPageEntity: state.messagesPageEntity?.copyWith(
              messages: messages,
            ),
            showNewerLoader: false,
          ),
        );
      },
    );
  }

  Future<void> getAroundContext({
    required String chatId,
    required int messageId,
    bool closeModal = false,
  }) async {
    final message = state.messagesPageEntity?.messages.firstWhereOrNull(
      (e) => e.id == messageId,
    );
    if (message != null) {
      final index = state.messagesPageEntity!.messages.indexOf(message);
      emit(
        state.copyWith(
          isLoading: false,
          shouldScroll: true,
          status: MessagesListStatus.aroundContext,
          highlightedMessageIndex: index,
          closeModal: closeModal,
        ),
      );
      return;
    }
    final result = await _getAroundContextUseCase(
      GetAroundContextParams(
        chatId: chatId,
        aroundMessageId: messageId.toString(),
      ),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            closeModal: closeModal,
          ),
        );
      },
      (r) {
        var index = -1;
        final message = r.messages.firstWhereOrNull((e) => e.id == messageId);
        if (message != null) {
          index = r.messages.indexOf(message);
        }
        emit(
          state.copyWith(
            messagesPageEntity: r,
            isLoading: false,
            shouldScroll: true,
            status: MessagesListStatus.aroundContext,
            highlightedMessageIndex: index,
            closeModal: closeModal,
          ),
        );
      },
    );
  }

  Future<void> sendMessage({
    required String chatId,
    String? replyToId,
    required MessageType type,
    String? body,
  }) async {
    final result = await _sendMessageUseCase(
      SendMessageParams(
        chatId: chatId,
        replyToId: replyToId,
        type: type,
        body: body,
      ),
    );
    result.fold((l) {
      emit(
        state.copyWith(
          error: AppUtils.parseFailureMessage(l),
          isLoading: false,
        ),
      );
    }, (r) {});
  }

  Future<void> updateMessage({
    required String chatId,
    required String messageId,
    required String body,
  }) async {
    final result = await _updateMessageUseCase(
      UpdateMessageParams(messageId: messageId, body: body),
    );
    result.fold((l) {
      emit(
        state.copyWith(
          error: AppUtils.parseFailureMessage(l),
          isLoading: false,
        ),
      );
    }, (r) {});
  }

  Future<void> deleteMessage({
    required String chatId,
    required String messageId,
  }) async {
    final result = await _deleteMessageUseCase(
      DeleteMessageParams(messageId: messageId),
    );
    result.fold((l) {
      emit(
        state.copyWith(
          error: AppUtils.parseFailureMessage(l),
          isLoading: false,
        ),
      );
    }, (r) {});
  }

  Future<void> addReaction({
    required String chatId,
    required String messageId,
    required ReactionType type,
  }) async {
    final result = await _addReactionUseCase(
      AddReactionParams(messageId: messageId, type: type),
    );
    result.fold((l) {
      emit(
        state.copyWith(
          error: AppUtils.parseFailureMessage(l),
          isLoading: false,
        ),
      );
    }, (r) {});
  }

  Future<void> deleteReaction({
    required String chatId,
    required String messageId,
  }) async {
    final result = await _deleteReactionUseCase(
      DeleteReactionParams(messageId: messageId),
    );
    result.fold((l) {
      emit(
        state.copyWith(
          error: AppUtils.parseFailureMessage(l),
          isLoading: false,
        ),
      );
    }, (r) {});
  }

  Future<void> getPinnedMessages({
    bool loadSilent = true,
    required String chatId,
  }) async {
    if (!loadSilent) {
      emit(state.copyWith(isLoading: true));
    }
    final result = await _getPinnedMessagesUseCase(
      GetPinnedMessagesParams(chatId: chatId),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(pinnedMessages: r, isLoading: false));
      },
    );
  }

  Future<void> pinMessage(int messageId) async {
    final result = await _pinMessageUseCase(
      PinMessageParams(messageId.toString()),
    );
    result.fold((l) {
      emit(
        state.copyWith(
          error: AppUtils.parseFailureMessage(l),
          isLoading: false,
        ),
      );
    }, (r) {});
  }

  Future<void> unpinMessage(int messageId, {closeModal = false}) async {
    final result = await _unpinMessageUseCase(
      UnpinMessageParams(messageId.toString()),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        if (closeModal) {
          emit(state.copyWith(closeModal: closeModal));
        }
      },
    );
  }

  Future<void> selectMessage(MessageEntity selectedMessage) async {
    emit(state.copyWith(showMenu: true, selectedMessage: selectedMessage));
  }

  Future<void> unSelectMessage() async {
    emit(
      state.copyWith(
        editModeActive: false,
        showMenu: false,
        replyModeActive: false,
        selectedMessage: null,
      ),
    );
  }

  Future<void> activateEditingMode() async {
    emit(state.copyWith(editModeActive: true, showMenu: false));
  }

  Future<void> activateReplyMode() async {
    emit(state.copyWith(replyModeActive: true, showMenu: false));
  }

  Future<void> disableReplyMode() async {
    emit(state.copyWith(replyModeActive: false));
  }

  Future<void> disableError() async {
    emit(state.copyWith(error: null));
  }

  Future<void> disableCloseModal() async {
    emit(state.copyWith(closeModal: false));
  }

  Future<void> disableShouldScroll() async {
    emit(state.copyWith(shouldScroll: false));
  }

  Future<void> highlightMessage(int id) async {
    emit(state.copyWith(highlightedMessageId: id));
    Future.delayed(const Duration(seconds: 1), () async {
      if (!isClosed) {
        await disableHighlightMessage();
        await disableShouldScroll();
      }
    });
  }

  Future<void> disableHighlightMessage() async {
    emit(
      state.copyWith(highlightedMessageId: null, highlightedMessageIndex: null),
    );
  }

  Future<void> disableSearch() async {
    emit(state.copyWith(searchResults: []));
  }
}

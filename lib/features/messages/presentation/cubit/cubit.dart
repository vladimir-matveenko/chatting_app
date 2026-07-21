import 'dart:async';
import 'dart:developer';

import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:chatting_app/features/messages/domain/usecases/add_reaction_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/delete_message_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/delete_reaction_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/get_pinned_messages_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/load_messages_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/pin_message_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/send_message_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/unpin_message_usecase.dart';
import 'package:chatting_app/features/messages/domain/usecases/update_message_usecase.dart';
import 'package:chatting_app/features/messages/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../app/utils/app_utils.dart';
import '../../../../core/websocket/events/events.dart';
import '../../data/socket/messages_socket_service.dart';

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
      _messagesSocketService.typingStarted.listen(
        (event) async => _onTypingStarted(event),
      ),
      _messagesSocketService.typingStopped.listen(
        (event) async => _onTypingStopped(event),
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
    log('Message ${event.messageId} has read');
  }

  void _onReactionUpdated(ReactionUpdatedSocketEvent event) async {
    await loadMessages(chatId: event.message.chatId);
  }

  void _onTypingStarted(TypingStartedSocketEvent event) {
    // TODO(): add action
  }

  void _onTypingStopped(TypingStoppedSocketEvent event) {
    // TODO(): add action
  }

  Future<void> _onMessagePinned(MessagePinnedSocketEvent event) async {
    log('Message from chat ${event.message.chatId} has pinned');
    await getPinnedMessages(chatId: event.message.chatId);
  }

  Future<void> _onMessageUnpinned(MessageUnpinnedSocketEvent event) async {
    log('Message from chat ${event.message.chatId} has unpinned');
    await getPinnedMessages(chatId: event.message.chatId);
  }

  Future<void> loadMessages({
    bool loadSilent = true,
    required String chatId,
  }) async {
    if (!loadSilent) {
      emit(state.copyWith(isLoading: true));
    }
    final result = await _loadMessagesUseCase(
      LoadMessagesParams(chatId: chatId),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            updateList: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(messages: r, isLoading: false, updateList: false));
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
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            updateList: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(isLoading: false, updateList: true));
      },
    );
  }

  Future<void> updateMessage({
    required String messageId,
    required String body,
  }) async {
    final result = await _updateMessageUseCase(
      UpdateMessageParams(messageId: messageId, body: body),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            updateList: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(isLoading: false, updateList: true));
      },
    );
  }

  Future<void> deleteMessage(String messageId) async {
    final result = await _deleteMessageUseCase(
      DeleteMessageParams(messageId: messageId),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            updateList: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(updateList: true));
      },
    );
  }

  Future<void> addReaction(
    String messageId, {
    required ReactionType type,
  }) async {
    final result = await _addReactionUseCase(
      AddReactionParams(messageId: messageId, type: type),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            updateList: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(updateList: true));
      },
    );
  }

  Future<void> deleteReaction(String messageId) async {
    final result = await _deleteReactionUseCase(
      DeleteReactionParams(messageId: messageId),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            updateList: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(updateList: true));
      },
    );
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
            updateList: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(pinnedMessages: r, isLoading: false));
      },
    );
  }

  Future<void> pinMessage(String messageId) async {
    final result = await _pinMessageUseCase(PinMessageParams(messageId));
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            updateList: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(isLoading: false));
      },
    );
  }

  Future<void> unpinMessage(String messageId) async {
    final result = await _unpinMessageUseCase(UnpinMessageParams(messageId));
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            updateList: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(isLoading: false));
      },
    );
  }

  Future<void> selectMessage(MessageEntity selectedMessage) async {
    emit(state.copyWith(showMenu: true, selectedMessage: selectedMessage));
  }

  Future<void> unSelectMessage() async {
    emit(state.copyWith(editModeActive: false, showMenu: false));
  }

  Future<void> activateEditingMode() async {
    emit(state.copyWith(editModeActive: true, showMenu: false));
  }

  Future<void> disableError() async {
    emit(state.copyWith(error: ''));
  }
}

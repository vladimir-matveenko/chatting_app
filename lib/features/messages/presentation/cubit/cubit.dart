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
  ) : super(const MessagesState());
  final LoadMessagesUseCase _loadMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final DeleteMessageUseCase _deleteMessageUseCase;
  final AddReactionUseCase _addReactionUseCase;
  final DeleteReactionUseCase _deleteReactionUseCase;
  final UpdateMessageUseCase _updateMessageUseCase;
  final PinMessageUseCase _pinMessageUseCase;
  final UnpinMessageUseCase _unpinMessageUseCase;
  final GetPinnedMessagesUseCase _getPinnedMessagesUseCase;

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

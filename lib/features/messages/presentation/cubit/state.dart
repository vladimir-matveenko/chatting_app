import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:chatting_app/features/messages/domain/entity/message_page_entity.dart';
import 'package:chatting_app/features/messages/domain/entity/message_search_result_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'cubit.dart';

part 'state.freezed.dart';

@freezed
abstract class MessagesState with _$MessagesState {
  const factory MessagesState({
    @Default([]) List<MessageEntity> pinnedMessages,
    @Default([]) List<MessageSearchResultEntity> searchResults,
    MessagesPageEntity? messagesPageEntity,
    String? error,
    MessageEntity? selectedMessage,
    int? highlightedMessageIndex,
    int? highlightedMessageId,
    @Default(false) bool showMenu,
    @Default(false) bool isLoading,
    @Default(false) bool showNewerLoader,
    @Default(false) bool showOlderLoader,
    @Default(false) bool editModeActive,
    @Default(false) bool replyModeActive,
    @Default(false) bool closeModal,
    @Default(false) bool shouldScroll,
    @Default(MessagesListStatus.list) MessagesListStatus status,
  }) = _MessagesState;
}

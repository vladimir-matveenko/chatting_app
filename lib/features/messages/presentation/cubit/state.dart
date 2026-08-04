import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:chatting_app/features/messages/domain/entity/message_page_entity.dart';
import 'package:chatting_app/features/messages/domain/entity/message_search_result_entity.dart';
import 'package:equatable/equatable.dart';

import 'cubit.dart';

class MessagesState extends Equatable {
  const MessagesState({
    this.status = MessagesListStatus.list,
    this.pinnedMessages = const [],
    this.searchResults = const [],
    this.messagesPageEntity,
    this.error,
    this.showMenu = false,
    this.isLoading = false,
    this.showNewerLoader = false,
    this.showOlderLoader = false,
    this.editModeActive = false,
    this.replyModeActive = false,
    this.closeModal = false,
    this.selectedMessage,
    this.highlightedMessageIndex,
    this.highlightedMessageId,
    this.shouldScroll = false,
  });

  final MessagesListStatus status;
  final List<MessageEntity> pinnedMessages;
  final List<MessageSearchResultEntity> searchResults;
  final MessagesPageEntity? messagesPageEntity;
  final String? error;
  final MessageEntity? selectedMessage;
  final int? highlightedMessageIndex;
  final int? highlightedMessageId;
  final bool showMenu;
  final bool isLoading;
  final bool showNewerLoader;
  final bool showOlderLoader;
  final bool editModeActive;
  final bool replyModeActive;
  final bool closeModal;
  final bool shouldScroll;

  MessagesState copyWith({
    MessagesListStatus? status,
    List<MessageEntity>? pinnedMessages,
    List<MessageSearchResultEntity>? searchResults,
    MessagesPageEntity? messagesPageEntity,
    String? error,
    MessageEntity? selectedMessage,
    int? highlightedMessageIndex,
    int? highlightedMessageId,
    bool? showMenu,
    bool? isLoading,
    bool? showNewerLoader,
    bool? showOlderLoader,
    bool? editModeActive,
    bool? replyModeActive,
    bool? closeModal,
    bool? shouldScroll,
  }) {
    return MessagesState(
      status: status ?? this.status,
      pinnedMessages: pinnedMessages ?? this.pinnedMessages,
      searchResults: searchResults ?? this.searchResults,
      messagesPageEntity: messagesPageEntity ?? this.messagesPageEntity,
      error: error ?? this.error,
      showMenu: showMenu ?? this.showMenu,
      selectedMessage: selectedMessage ?? this.selectedMessage,
      highlightedMessageIndex:
          highlightedMessageIndex ?? this.highlightedMessageIndex,
      isLoading: isLoading ?? this.isLoading,
      showNewerLoader: showNewerLoader ?? this.showNewerLoader,
      showOlderLoader: showOlderLoader ?? this.showOlderLoader,
      editModeActive: editModeActive ?? this.editModeActive,
      replyModeActive: replyModeActive ?? this.replyModeActive,
      closeModal: closeModal ?? this.closeModal,
      highlightedMessageId: highlightedMessageId ?? this.highlightedMessageId,
      shouldScroll: shouldScroll ?? this.shouldScroll,
    );
  }

  @override
  List<dynamic> get props => [
    status,
    pinnedMessages,
    searchResults,
    messagesPageEntity,
    error,
    isLoading,
    showNewerLoader,
    showOlderLoader,
    showMenu,
    selectedMessage,
    highlightedMessageIndex,
    editModeActive,
    replyModeActive,
    closeModal,
    highlightedMessageId,
    shouldScroll,
  ];
}

import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:chatting_app/features/messages/domain/entity/message_page_entity.dart';
import 'package:equatable/equatable.dart';

import 'cubit.dart';

class MessagesState extends Equatable {
  const MessagesState({
    this.status = MessagesListStatus.list,
    this.pinnedMessages = const [],
    this.messagesPageEntity,
    this.error,
    this.showMenu = false,
    this.isLoading = false,
    this.showNewerLoader = false,
    this.showOlderLoader = false,
    this.editModeActive = false,
    this.closeModal = false,
    this.selectedMessage,
    this.highlightedMessageId,
  });

  final MessagesListStatus status;
  final List<MessageEntity> pinnedMessages;
  final MessagesPageEntity? messagesPageEntity;
  final String? error;
  final MessageEntity? selectedMessage;
  final int? highlightedMessageId;
  final bool showMenu;
  final bool isLoading;
  final bool showNewerLoader;
  final bool showOlderLoader;
  final bool editModeActive;
  final bool closeModal;

  MessagesState copyWith({
    MessagesListStatus? status,
    List<MessageEntity>? pinnedMessages,
    MessagesPageEntity? messagesPageEntity,
    String? error,
    MessageEntity? selectedMessage,
    int? highlightedMessageId,
    bool? showMenu,
    bool? isLoading,
    bool? showNewerLoader,
    bool? showOlderLoader,
    bool? editModeActive,
    bool? closeModal,
  }) {
    return MessagesState(
      status: status ?? this.status,
      pinnedMessages: pinnedMessages ?? this.pinnedMessages,
      messagesPageEntity: messagesPageEntity ?? this.messagesPageEntity,
      error: error ?? this.error,
      showMenu: showMenu ?? this.showMenu,
      selectedMessage: selectedMessage ?? this.selectedMessage,
      isLoading: isLoading ?? this.isLoading,
      showNewerLoader: showNewerLoader ?? this.showNewerLoader,
      showOlderLoader: showOlderLoader ?? this.showOlderLoader,
      editModeActive: editModeActive ?? this.editModeActive,
      closeModal: closeModal ?? this.closeModal,
      highlightedMessageId: highlightedMessageId ?? this.highlightedMessageId,
    );
  }

  @override
  List<dynamic> get props => [
    status,
    pinnedMessages,
    messagesPageEntity,
    error,
    isLoading,
    showNewerLoader,
    showOlderLoader,
    showMenu,
    selectedMessage,
    editModeActive,
    closeModal,
    highlightedMessageId,
  ];
}

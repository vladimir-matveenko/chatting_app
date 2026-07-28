import 'package:chatting_app/features/messages/domain/entity/around_context_entity.dart';
import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:equatable/equatable.dart';

class MessagesState extends Equatable {
  const MessagesState({
    this.messages = const [],
    this.pinnedMessages = const [],
    this.aroundContext,
    this.error,
    this.showMenu = false,
    this.isLoading = false,
    this.editModeActive = false,
    this.closeModal = false,
    this.selectedMessage,
  });

  final List<MessageEntity> messages;
  final List<MessageEntity> pinnedMessages;
  final AroundContextEntity? aroundContext;
  final String? error;
  final MessageEntity? selectedMessage;
  final bool showMenu;
  final bool isLoading;
  final bool editModeActive;
  final bool closeModal;

  MessagesState copyWith({
    List<MessageEntity>? messages,
    List<MessageEntity>? pinnedMessages,
    AroundContextEntity? aroundContext,
    String? error,
    MessageEntity? selectedMessage,
    bool? showMenu,
    bool? isLoading,
    bool? editModeActive,
    bool? closeModal,
  }) {
    return MessagesState(
      messages: messages ?? this.messages,
      pinnedMessages: pinnedMessages ?? this.pinnedMessages,
      aroundContext: aroundContext ?? this.aroundContext,
      error: error ?? this.error,
      showMenu: showMenu ?? this.showMenu,
      selectedMessage: selectedMessage ?? this.selectedMessage,
      isLoading: isLoading ?? this.isLoading,
      editModeActive: editModeActive ?? this.editModeActive,
      closeModal: closeModal ?? this.closeModal,
    );
  }

  @override
  List<dynamic> get props => [
    messages,
    pinnedMessages,
    aroundContext,
    error,
    isLoading,
    showMenu,
    selectedMessage,
    editModeActive,
    closeModal,
  ];
}

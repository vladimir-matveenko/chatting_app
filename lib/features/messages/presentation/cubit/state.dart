import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:equatable/equatable.dart';

class MessagesState extends Equatable {
  const MessagesState({
    this.messages = const [],
    this.pinnedMessages = const [],
    this.error,
    this.showMenu = false,
    this.isLoading = false,
    this.editModeActive = false,
    this.selectedMessage,
  });

  final List<MessageEntity> messages;
  final List<MessageEntity> pinnedMessages;
  final String? error;
  final MessageEntity? selectedMessage;
  final bool showMenu;
  final bool isLoading;
  final bool editModeActive;

  MessagesState copyWith({
    List<MessageEntity>? messages,
    List<MessageEntity>? pinnedMessages,
    String? error,
    MessageEntity? selectedMessage,
    bool? showMenu,
    bool? isLoading,
    bool? editModeActive,
  }) {
    return MessagesState(
      messages: messages ?? this.messages,
      pinnedMessages: pinnedMessages ?? this.pinnedMessages,
      error: error ?? this.error,
      showMenu: showMenu ?? this.showMenu,
      selectedMessage: selectedMessage ?? this.selectedMessage,
      isLoading: isLoading ?? this.isLoading,
      editModeActive: editModeActive ?? this.editModeActive,
    );
  }

  @override
  List<dynamic> get props => [
    messages,
    pinnedMessages,
    error,
    isLoading,
    showMenu,
    selectedMessage,
    editModeActive,
  ];
}

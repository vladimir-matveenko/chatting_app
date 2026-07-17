import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:equatable/equatable.dart';

class MessagesState extends Equatable {
  const MessagesState({
    this.messages = const [],
    this.error,
    this.showMenu = false,
    this.isLoading = false,
    this.updateList = false,
    this.editModeActive = false,
    this.selectedMessage,
  });

  final List<MessageEntity> messages;
  final String? error;
  final MessageEntity? selectedMessage;
  final bool showMenu;
  final bool isLoading;
  final bool updateList;
  final bool editModeActive;

  MessagesState copyWith({
    List<MessageEntity>? messages,
    String? error,
    MessageEntity? selectedMessage,
    bool? showMenu,
    bool? isLoading,
    bool? updateList,
    bool? editModeActive,
  }) {
    return MessagesState(
      messages: messages ?? this.messages,
      error: error ?? this.error,
      showMenu: showMenu ?? this.showMenu,
      selectedMessage: selectedMessage ?? this.selectedMessage,
      isLoading: isLoading ?? this.isLoading,
      updateList: updateList ?? this.updateList,
      editModeActive: editModeActive ?? this.editModeActive,
    );
  }

  @override
  List<dynamic> get props => [
    messages,
    error,
    isLoading,
    updateList,
    showMenu,
    selectedMessage,
    editModeActive,
  ];
}

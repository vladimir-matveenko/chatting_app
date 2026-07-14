import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:equatable/equatable.dart';

class MessagesState extends Equatable {
  const MessagesState({
    this.messages = const [],
    this.error,
    this.isLoading = false,
    this.updateList = false,
  });

  final List<MessageEntity> messages;
  final String? error;
  final bool isLoading;
  final bool updateList;

  MessagesState copyWith({
    List<MessageEntity>? messages,
    String? error,
    bool? isLoading,
    bool? updateList,
  }) {
    return MessagesState(
      messages: messages ?? this.messages,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      updateList: updateList ?? this.updateList,
    );
  }

  @override
  List<dynamic> get props => [messages, error, isLoading, updateList];
}

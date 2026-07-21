import 'socket_event.dart';

class TypingStartedSocketEvent extends SocketEvent {
  const TypingStartedSocketEvent({required this.chatId, required this.userId});

  final String chatId;
  final String userId;
}

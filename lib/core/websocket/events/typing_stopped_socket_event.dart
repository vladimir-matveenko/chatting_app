import 'socket_event.dart';

class TypingStoppedSocketEvent extends SocketEvent {
  const TypingStoppedSocketEvent({required this.chatId, required this.userId});

  final String chatId;
  final String userId;
}

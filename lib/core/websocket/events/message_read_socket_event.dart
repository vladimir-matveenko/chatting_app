import 'socket_event.dart';

class MessageReadSocketEvent extends SocketEvent {
  const MessageReadSocketEvent({
    required this.chatId,
    required this.messageId,
    required this.userId,
  });

  final String chatId;
  final String messageId;
  final String userId;
}

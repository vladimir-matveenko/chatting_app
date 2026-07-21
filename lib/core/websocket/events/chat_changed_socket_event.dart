import 'socket_event.dart';

class ChatChangedSocketEvent extends SocketEvent {
  const ChatChangedSocketEvent({required this.chatId});

  final String chatId;
}

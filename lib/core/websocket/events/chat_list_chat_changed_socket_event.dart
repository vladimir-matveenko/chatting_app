import 'socket_event.dart';

class ChatListChatChangedSocketEvent extends SocketEvent {
  const ChatListChatChangedSocketEvent({required this.chatId});

  final String chatId;
}

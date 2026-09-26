import 'package:chatting_app/core/websocket/events/chat_list_chat_changed_socket_event.dart';
import 'package:chatting_app/core/websocket/events/chat_list_message_created_socket_event.dart';

import '../../../../core/websocket/events/events.dart';

abstract interface class ChatsSocketService {
  Stream<SocketEvent> get events;

  Stream<ChatListChatChangedSocketEvent> get chatChanged;

  Stream<ChatListMessageCreatedSocketEvent> get messageCreated;

  Stream<MessageReadSocketEvent> get messageRead;
}

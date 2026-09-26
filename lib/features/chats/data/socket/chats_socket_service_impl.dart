import 'dart:async';

import 'package:chatting_app/core/websocket/events/chat_list_chat_changed_socket_event.dart';
import 'package:chatting_app/core/websocket/events/chat_list_message_created_socket_event.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/websocket/events/events.dart';
import '../../../../core/websocket/socket_service.dart';
import 'chats_socket_service.dart';

@LazySingleton(as: ChatsSocketService)
class ChatSocketServiceImpl implements ChatsSocketService {
  ChatSocketServiceImpl(this._socket);

  final SocketService _socket;

  @override
  Stream<SocketEvent> get events => _socket.socketEvents;

  @override
  Stream<ChatListChatChangedSocketEvent> get chatChanged =>
      _events<ChatListChatChangedSocketEvent>();

  @override
  Stream<MessageReadSocketEvent> get messageRead =>
      _events<MessageReadSocketEvent>();

  @override
  Stream<ChatListMessageCreatedSocketEvent> get messageCreated =>
      _events<ChatListMessageCreatedSocketEvent>();

  Stream<T> _events<T extends SocketEvent>() {
    return _socket.socketEvents.where((event) => event is T).cast<T>();
  }
}

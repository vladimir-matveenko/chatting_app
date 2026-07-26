import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/websocket/events/events.dart';
import '../../../../core/websocket/socket_service.dart';
import 'chats_socket_service.dart';

@LazySingleton(as: ChatsSocketService)
class ChatSocketServiceImpl implements ChatsSocketService {
  ChatSocketServiceImpl(this._socket) {
    _initRefreshChats();
  }

  final SocketService _socket;

  final _refreshChatsController = StreamController<void>.broadcast();

  @override
  Stream<SocketEvent> get events => _socket.socketEvents;

  Stream<ChatChangedSocketEvent> get _chatChanged =>
      _events<ChatChangedSocketEvent>();

  Stream<MessageReadSocketEvent> get _messageRead =>
      _events<MessageReadSocketEvent>();

  @override
  Stream<void> get refreshChats => _refreshChatsController.stream;

  void _initRefreshChats() {
    _chatChanged.listen((_) {
      _refreshChatsController.add(null);
    });

    _messageRead.listen((_) {
      _refreshChatsController.add(null);
    });
  }

  Stream<T> _events<T extends SocketEvent>() {
    return _socket.socketEvents.where((event) => event is T).cast<T>();
  }
}

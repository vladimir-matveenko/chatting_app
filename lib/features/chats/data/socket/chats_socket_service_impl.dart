import 'package:injectable/injectable.dart';

import '../../../../core/websocket/events/socket_event.dart';
import '../../../../core/websocket/socket_service.dart';
import 'chats_socket_service.dart';

@LazySingleton(as: ChatsSocketService)
class ChatSocketServiceImpl implements ChatsSocketService {
  ChatSocketServiceImpl(this._socket);

  final SocketService _socket;

  @override
  Stream<SocketEvent> get events => _socket.socketEvents;
}

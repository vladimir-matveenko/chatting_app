import '../../../../core/websocket/events/socket_event.dart';

abstract interface class ChatsSocketService {
  Stream<SocketEvent> get events;
}

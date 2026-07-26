import '../../../../core/websocket/events/events.dart';

abstract interface class ChatsSocketService {
  Stream<SocketEvent> get events;

  Stream<void> get refreshChats;
}

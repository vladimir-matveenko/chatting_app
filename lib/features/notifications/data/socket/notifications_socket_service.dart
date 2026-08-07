import '../../../../core/websocket/events/events.dart';

abstract interface class NotificationSocketService {
  Stream<SocketEvent> get events;

  Stream<void> get refreshData;
}

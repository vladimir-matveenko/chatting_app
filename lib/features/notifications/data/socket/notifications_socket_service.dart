import 'package:chatting_app/core/websocket/events/notification_created_socket_event.dart';

import '../../../../core/websocket/events/events.dart';

abstract interface class NotificationSocketService {
  Stream<SocketEvent> get events;

  Stream<NotificationCreatedSocketEvent> get notificationCreated;
}

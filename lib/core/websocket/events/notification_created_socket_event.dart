import 'package:chatting_app/features/notifications/data/models/notification_model.dart';

import 'socket_event.dart';

class NotificationCreatedSocketEvent extends SocketEvent {
  const NotificationCreatedSocketEvent({required this.notification});

  final NotificationModel notification;
}

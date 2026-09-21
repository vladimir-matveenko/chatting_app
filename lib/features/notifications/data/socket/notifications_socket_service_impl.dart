import 'dart:async';

import 'package:chatting_app/core/websocket/events/notification_created_socket_event.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/websocket/events/events.dart';
import '../../../../core/websocket/socket_service.dart';
import 'notifications_socket_service.dart';

@LazySingleton(as: NotificationSocketService)
class NotificationSocketServiceImpl implements NotificationSocketService {
  NotificationSocketServiceImpl(this._socket);

  final SocketService _socket;

  @override
  Stream<SocketEvent> get events => _socket.socketEvents;

  @override
  Stream<NotificationCreatedSocketEvent> get notificationCreated =>
      _events<NotificationCreatedSocketEvent>();

  Stream<T> _events<T extends SocketEvent>() {
    return _socket.socketEvents.where((event) => event is T).cast<T>();
  }
}

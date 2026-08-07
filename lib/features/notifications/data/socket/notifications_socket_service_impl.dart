import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/websocket/events/events.dart';
import '../../../../core/websocket/socket_service.dart';
import 'notifications_socket_service.dart';

@LazySingleton(as: NotificationSocketService)
class NotificationSocketServiceImpl implements NotificationSocketService {
  NotificationSocketServiceImpl(this._socket) {
    _initRefreshData();
  }

  final SocketService _socket;

  final _refreshDataController = StreamController<void>.broadcast();

  @override
  Stream<SocketEvent> get events => _socket.socketEvents;

  Stream<ChatChangedSocketEvent> get _notificationCreated =>
      _events<ChatChangedSocketEvent>();

  @override
  Stream<void> get refreshData => _refreshDataController.stream;

  void _initRefreshData() {
    _notificationCreated.listen((_) {
      _refreshDataController.add(null);
    });
  }

  Stream<T> _events<T extends SocketEvent>() {
    return _socket.socketEvents.where((event) => event is T).cast<T>();
  }
}

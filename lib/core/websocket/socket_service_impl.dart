import 'dart:async';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'events/socket_event.dart';
import 'socket_events.dart';
import 'socket_events_mapper.dart';
import 'socket_service.dart';

@LazySingleton(as: SocketService)
class SocketServiceImpl implements SocketService {
  io.Socket? _socket;

  final _controller = StreamController<SocketEvent>.broadcast();

  @override
  Stream<SocketEvent> get socketEvents => _controller.stream;

  @override
  bool get isConnected => _socket?.connected ?? false;

  @override
  Future<void> connect(String token) async {
    if (isConnected) {
      return;
    }

    _socket = io.io(
      'http://localhost:3000',
      io.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setAuth({'token': token})
          .build(),
    );

    _registerEvents();

    _socket!.connect();
  }

  @override
  Future<void> disconnect() async {
    _socket?.dispose();

    _socket = null;
  }

  @override
  void emit(String event, dynamic data) {
    _socket?.emit(event, data);
  }

  void _registerEvents() {
    /// incoming events list
    final events = [
      SocketEvents.messageCreated,
      SocketEvents.messageUpdated,
      SocketEvents.messageDeleted,
      SocketEvents.messagePinned,
      SocketEvents.messageUnpinned,
      SocketEvents.typingStarted,
      SocketEvents.typingStopped,
      SocketEvents.reactionUpdated,
      SocketEvents.messageRead,
      SocketEvents.presenceOnline,
      SocketEvents.presenceOffline,
      SocketEvents.chatChanged,
      SocketEvents.exception,
    ];

    for (final event in events) {
      _socket!.on(event, (payload) {
        try {
          final socketEvent = SocketEventsMapper.from(event, payload);

          _controller.add(socketEvent);
        } catch (e, s) {
          log('$e');
          log('$s');
        }
      });
    }
  }
}

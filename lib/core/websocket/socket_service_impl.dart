import 'dart:async';
import 'dart:developer';

import 'package:chatting_app/core/websocket/socket_token_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../app_env.dart';
import 'events/socket_event.dart';
import 'socket_events.dart';
import 'socket_events_mapper.dart';
import 'socket_service.dart';

@LazySingleton(as: SocketService)
class SocketServiceImpl implements SocketService {
  SocketServiceImpl(this._tokenProvider);

  final SocketTokenProvider _tokenProvider;

  io.Socket? _socket;
  String? _currentToken;

  final _controller = StreamController<SocketEvent>.broadcast();

  @override
  Stream<SocketEvent> get socketEvents => _controller.stream;

  @override
  bool get isConnected => _socket?.connected ?? false;

  @override
  Future<void> connect() async {
    final token = await _tokenProvider();

    if (token == null) {
      return;
    }

    if (_currentToken == token && isConnected) {
      return;
    }

    await disconnect();

    _currentToken = token;

    _socket = io.io(
      AppEnv.baseUrl,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .enableForceNew()
          .enableReconnection()
          .setReconnectionAttempts(10)
          .setReconnectionDelay(2000)
          .disableAutoConnect()
          .setAuth({'token': token})
          .build(),
    );

    _registerEvents();

    _socket!.onReconnectAttempt((_) async {
      _socket!.auth = {'token': token};
    });

    _socket!.connect();
  }

  @override
  Future<void> disconnect() async {
    final socket = _socket;

    if (socket == null) {
      return;
    }

    socket.clearListeners();
    socket.disconnect();
    socket.close();
    socket.dispose();

    _socket = null;
    _currentToken = null;
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

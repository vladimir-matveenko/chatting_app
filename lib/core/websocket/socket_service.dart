import 'events/socket_event.dart';

abstract interface class SocketService {
  Stream<SocketEvent> get socketEvents;

  Future<void> connect();

  Future<void> disconnect();

  void emit(String event, dynamic data);

  bool get isConnected;
}

import 'socket_event.dart';

class PresenceOnlineSocketEvent extends SocketEvent {
  const PresenceOnlineSocketEvent({required this.userId});

  final String userId;
}

import 'socket_event.dart';

class PresenceOfflineSocketEvent extends SocketEvent {
  const PresenceOfflineSocketEvent({required this.userId});

  final String userId;
}

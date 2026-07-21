import 'socket_event.dart';

class ExceptionSocketEvent extends SocketEvent {
  const ExceptionSocketEvent({required this.message});

  final String message;
}

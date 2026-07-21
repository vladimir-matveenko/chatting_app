import '../../../features/messages/data/models/message_model.dart';
import 'socket_event.dart';

class MessageCreatedSocketEvent extends SocketEvent {
  const MessageCreatedSocketEvent({required this.message});

  final MessageModel message;
}

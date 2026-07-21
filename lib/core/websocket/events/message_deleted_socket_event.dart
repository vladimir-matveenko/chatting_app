import '../../../features/messages/data/models/message_model.dart';
import 'socket_event.dart';

class MessageDeletedSocketEvent extends SocketEvent {
  const MessageDeletedSocketEvent({required this.message});

  final MessageModel message;
}

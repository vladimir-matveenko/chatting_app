import '../../../features/messages/data/models/message_model.dart';
import 'socket_event.dart';

class MessageUpdatedSocketEvent extends SocketEvent {
  const MessageUpdatedSocketEvent({required this.message});

  final MessageModel message;
}

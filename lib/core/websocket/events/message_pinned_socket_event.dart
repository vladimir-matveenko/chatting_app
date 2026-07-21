import '../../../features/messages/data/models/message_model.dart';
import 'socket_event.dart';

class MessagePinnedSocketEvent extends SocketEvent {
  const MessagePinnedSocketEvent({required this.message});

  final MessageModel message;
}

import '../../../features/messages/data/models/message_model.dart';
import 'socket_event.dart';

class MessageUnpinnedSocketEvent extends SocketEvent {
  const MessageUnpinnedSocketEvent({required this.message});

  final MessageModel message;
}

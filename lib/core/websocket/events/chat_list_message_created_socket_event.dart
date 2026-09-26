import '../../../features/messages/data/models/message_model.dart';
import 'socket_event.dart';

class ChatListMessageCreatedSocketEvent extends SocketEvent {
  const ChatListMessageCreatedSocketEvent({required this.message});

  final MessageModel message;
}

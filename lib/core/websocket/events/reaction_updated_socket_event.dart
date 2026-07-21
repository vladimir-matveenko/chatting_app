import '../../../features/messages/data/models/message_model.dart';
import 'socket_event.dart';

class ReactionUpdatedSocketEvent extends SocketEvent {
  const ReactionUpdatedSocketEvent({required this.message});

  final MessageModel message;
}

import 'package:chatting_app/features/messages/data/models/message_model.dart';

import 'events/events.dart';
import 'socket_events.dart';

abstract final class SocketEventsMapper {
  static SocketEvent from(String event, dynamic payload) {
    final json = Map<String, dynamic>.from(payload as Map);

    switch (event) {
      case SocketEvents.messageCreated:
        return MessageCreatedSocketEvent(message: MessageModel.fromJson(json));

      case SocketEvents.messageUpdated:
        return MessageUpdatedSocketEvent(message: MessageModel.fromJson(json));

      case SocketEvents.messageDeleted:
        return MessageDeletedSocketEvent(message: MessageModel.fromJson(json));

      case SocketEvents.messagePinned:
        return MessagePinnedSocketEvent(message: MessageModel.fromJson(json));

      case SocketEvents.messageUnpinned:
        return MessageUnpinnedSocketEvent(message: MessageModel.fromJson(json));

      case SocketEvents.reactionUpdated:
        return ReactionUpdatedSocketEvent(message: MessageModel.fromJson(json));

      case SocketEvents.typingStarted:
        return TypingStartedSocketEvent(
          chatId: json['chatId'] as String,
          userId: json['userId'] as String,
        );

      case SocketEvents.typingStopped:
        return TypingStoppedSocketEvent(
          chatId: json['chatId'] as String,
          userId: json['userId'] as String,
        );

      case SocketEvents.messageRead:
        return MessageReadSocketEvent(
          chatId: json['chatId'] as String,
          messageId: json['messageId'] as String,
          userId: json['userId'] as String,
        );

      case SocketEvents.presenceOnline:
        return PresenceOnlineSocketEvent(userId: json['userId'] as String);

      case SocketEvents.presenceOffline:
        return PresenceOfflineSocketEvent(userId: json['userId'] as String);

      case SocketEvents.chatChanged:
        return ChatChangedSocketEvent(chatId: json['chatId'] as String);

      case SocketEvents.exception:
        return ExceptionSocketEvent(message: json['message'] as String);

      default:
        throw UnsupportedError('Unknown socket event: $event');
    }
  }
}

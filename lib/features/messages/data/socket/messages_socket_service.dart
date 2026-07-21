import '../../../../core/websocket/events/events.dart';

abstract interface class MessagesSocketService {
  Stream<SocketEvent> get events;

  void createMessage({required String chatId, required String messageId});

  void updateMessage({required String chatId, required String messageId});

  void deleteMessage({required String chatId, required String messageId});

  void markRead({required String chatId, required String messageId});

  void updateReaction({required String chatId, required String messageId});

  void pinMessage({required String chatId, required String messageId});

  void unpinMessage({required String chatId, required String messageId});

  void startTyping(String chatId);

  void stopTyping(String chatId);

  Stream<MessageCreatedSocketEvent> get messageCreated;

  Stream<MessageUpdatedSocketEvent> get messageUpdated;

  Stream<MessageDeletedSocketEvent> get messageDeleted;

  Stream<ReactionUpdatedSocketEvent> get reactionUpdated;

  Stream<MessageReadSocketEvent> get messageRead;

  Stream<MessagePinnedSocketEvent> get messagePinned;

  Stream<MessageUnpinnedSocketEvent> get messageUnpinned;

  Stream<TypingStartedSocketEvent> get typingStarted;

  Stream<TypingStoppedSocketEvent> get typingStopped;
}

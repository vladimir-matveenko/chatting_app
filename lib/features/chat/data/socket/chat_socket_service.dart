import '../../../../core/websocket/events/events.dart';

abstract interface class ChatSocketService {
  Stream<SocketEvent> get events;

  void joinChat(String chatId);

  void leaveChat(String chatId);

  void startTyping(String chatId);

  void stopTyping(String chatId);

  Stream<PresenceOnlineSocketEvent> get userOnline;

  Stream<PresenceOfflineSocketEvent> get userOffline;

  Stream<TypingStartedSocketEvent> get typingStarted;

  Stream<TypingStoppedSocketEvent> get typingStopped;

  Stream<ChatChangedSocketEvent> get chatChanged;
}

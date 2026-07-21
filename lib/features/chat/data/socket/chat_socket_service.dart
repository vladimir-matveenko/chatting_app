import '../../../../core/websocket/events/socket_event.dart';

abstract interface class ChatSocketService {
  Stream<SocketEvent> get events;

  void joinChat(String chatId);

  void leaveChat(String chatId);

  void startTyping(String chatId);

  void stopTyping(String chatId);

  void markRead({required String chatId, required String messageId});
}

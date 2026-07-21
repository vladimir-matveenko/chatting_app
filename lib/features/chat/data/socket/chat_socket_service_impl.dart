import 'package:injectable/injectable.dart';

import '../../../../core/websocket/events/socket_event.dart';
import '../../../../core/websocket/socket_events.dart';
import '../../../../core/websocket/socket_service.dart';
import 'chat_socket_service.dart';

@LazySingleton(as: ChatSocketService)
class ChatSocketServiceImpl implements ChatSocketService {
  ChatSocketServiceImpl(this._socket);

  final SocketService _socket;

  String? _currentChatId;

  @override
  Stream<SocketEvent> get events => _socket.socketEvents;

  @override
  void joinChat(String chatId) {
    if (_currentChatId == chatId) {
      return;
    }
    _socket.emit(SocketEvents.joinChat, chatId);
  }

  @override
  void leaveChat(String chatId) {
    if (_currentChatId != chatId) {
      return;
    }
    _socket.emit(SocketEvents.leaveChat, chatId);
  }

  @override
  void startTyping(String chatId) {
    _socket.emit(SocketEvents.typingStart, chatId);
  }

  @override
  void stopTyping(String chatId) {
    _socket.emit(SocketEvents.typingStop, chatId);
  }

  @override
  void markRead({required String chatId, required String messageId}) {
    _socket.emit(SocketEvents.messageRead, {
      'chatId': chatId,
      'messageId': messageId,
    });
  }
}

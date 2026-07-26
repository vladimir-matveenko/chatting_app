import 'package:injectable/injectable.dart';

import '../../../../core/websocket/events/events.dart';
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
    if (_currentChatId != null) {
      _socket.emit(SocketEvents.leaveChat, _currentChatId!);
    }

    _currentChatId = chatId;
    _socket.emit(SocketEvents.joinChat, chatId);
  }

  @override
  void leaveChat(String chatId) {
    if (_currentChatId != chatId) {
      return;
    }

    _socket.emit(SocketEvents.leaveChat, chatId);
    _currentChatId = null;
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
  Stream<TypingStartedSocketEvent> get typingStarted =>
      _events<TypingStartedSocketEvent>();

  @override
  Stream<TypingStoppedSocketEvent> get typingStopped =>
      _events<TypingStoppedSocketEvent>();

  @override
  Stream<PresenceOnlineSocketEvent> get userOnline =>
      _events<PresenceOnlineSocketEvent>();

  @override
  Stream<PresenceOfflineSocketEvent> get userOffline =>
      _events<PresenceOfflineSocketEvent>();

  @override
  Stream<ChatChangedSocketEvent> get chatChanged =>
      _events<ChatChangedSocketEvent>();

  Stream<T> _events<T extends SocketEvent>() {
    return _socket.socketEvents.where((event) => event is T).cast<T>();
  }
}

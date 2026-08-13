import 'dart:async';

import '../socket/chat_socket_service.dart';

class TypingController {
  TypingController({required this.chatId, required this.socketService});

  final String chatId;
  final ChatSocketService socketService;

  Timer? _timer;
  bool _isTyping = false;

  void onTextChanged(String text) {
    if (text.trim().isEmpty) {
      stop();
      return;
    }

    if (!_isTyping) {
      _isTyping = true;
      socketService.startTyping(chatId);
    }

    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 2), stop);
  }

  void stop() {
    _timer?.cancel();
    _timer = null;

    if (!_isTyping) {
      return;
    }

    _isTyping = false;
    socketService.stopTyping(chatId);
  }

  void dispose() {
    stop();
  }
}

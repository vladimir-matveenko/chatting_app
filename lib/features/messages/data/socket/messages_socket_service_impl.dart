import 'dart:async';

import 'package:chatting_app/core/websocket/events/message_created_socket_event.dart';
import 'package:chatting_app/core/websocket/events/message_deleted_socket_event.dart';
import 'package:chatting_app/core/websocket/events/message_pinned_socket_event.dart';
import 'package:chatting_app/core/websocket/events/message_read_socket_event.dart';
import 'package:chatting_app/core/websocket/events/message_unpinned_socket_event.dart';
import 'package:chatting_app/core/websocket/events/message_updated_socket_event.dart';
import 'package:chatting_app/core/websocket/events/reaction_updated_socket_event.dart';
import 'package:chatting_app/core/websocket/events/typing_started_socket_event.dart';
import 'package:chatting_app/core/websocket/events/typing_stopped_socket_event.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/websocket/events/socket_event.dart';
import '../../../../core/websocket/socket_events.dart';
import '../../../../core/websocket/socket_service.dart';
import 'messages_socket_service.dart';

@LazySingleton(as: MessagesSocketService)
class MessagesSocketServiceImpl implements MessagesSocketService {
  MessagesSocketServiceImpl(this._socket);

  final SocketService _socket;

  @override
  Stream<SocketEvent> get events => _socket.socketEvents;

  @override
  Stream<MessageCreatedSocketEvent> get messageCreated =>
      _events<MessageCreatedSocketEvent>();

  @override
  Stream<MessageDeletedSocketEvent> get messageDeleted =>
      _events<MessageDeletedSocketEvent>();

  @override
  Stream<MessageReadSocketEvent> get messageRead =>
      _events<MessageReadSocketEvent>();

  @override
  Stream<MessageUpdatedSocketEvent> get messageUpdated =>
      _events<MessageUpdatedSocketEvent>();

  @override
  Stream<ReactionUpdatedSocketEvent> get reactionUpdated =>
      _events<ReactionUpdatedSocketEvent>();

  @override
  Stream<MessagePinnedSocketEvent> get messagePinned =>
      _events<MessagePinnedSocketEvent>();

  @override
  Stream<MessageUnpinnedSocketEvent> get messageUnpinned =>
      _events<MessageUnpinnedSocketEvent>();

  @override
  Stream<TypingStartedSocketEvent> get typingStarted =>
      _events<TypingStartedSocketEvent>();

  @override
  Stream<TypingStoppedSocketEvent> get typingStopped =>
      _events<TypingStoppedSocketEvent>();

  @override
  void createMessage({required String chatId, required String messageId}) {
    _socket.emit(SocketEvents.messageCreated, chatId);
  }

  @override
  void updateMessage({required String chatId, required String messageId}) {
    _socket.emit(SocketEvents.messageUpdated, chatId);
  }

  @override
  void deleteMessage({required String chatId, required String messageId}) {
    _socket.emit(SocketEvents.messageDeleted, chatId);
  }

  @override
  void markRead({required String chatId, required String messageId}) {
    _socket.emit(SocketEvents.messageRead, {
      'chatId': chatId,
      'messageId': messageId,
    });
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
  void updateReaction({required String chatId, required String messageId}) {
    _socket.emit(SocketEvents.reactionUpdated, {
      'chatId': chatId,
      'messageId': messageId,
    });
  }

  @override
  void pinMessage({required String chatId, required String messageId}) {
    _socket.emit(SocketEvents.messagePinned, {
      'chatId': chatId,
      'messageId': messageId,
    });
  }

  @override
  void unpinMessage({required String chatId, required String messageId}) {
    _socket.emit(SocketEvents.messageUnpinned, {
      'chatId': chatId,
      'messageId': messageId,
    });
  }

  Stream<T> _events<T extends SocketEvent>() {
    return _socket.socketEvents.where((event) => event is T).cast<T>();
  }
}

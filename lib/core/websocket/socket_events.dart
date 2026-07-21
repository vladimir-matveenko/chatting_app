abstract final class SocketEvents {
  static const joinChat = 'chat:join';

  static const leaveChat = 'chat:leave';

  static const typingStart = 'typing:start';

  static const typingStop = 'typing:stop';

  static const messageCreated = 'message:created';

  static const messageUpdated = 'message:updated';

  static const messageDeleted = 'message:deleted';

  static const messagePinned = 'message:pinned';

  static const messageUnpinned = 'message:unpinned';

  static const reactionUpdated = 'reaction:updated';

  static const messageRead = 'message:read';

  static const typingStarted = 'typing:started';

  static const typingStopped = 'typing:stopped';

  static const presenceOnline = 'presence:online';

  static const presenceOffline = 'presence:offline';

  static const chatChanged = 'chat:changed';

  static const exception = 'exception';
}

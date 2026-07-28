abstract final class ChatScrollAlignment {
  const ChatScrollAlignment._();

  /// Последние сообщения (index = 0).
  static const double latest = .1;

  /// Сообщение немного выше центра экрана.
  /// Используется для pinned, reply, search.
  static const double focused = .35;

  /// Сообщение по центру.
  static const double centered = .5;
}

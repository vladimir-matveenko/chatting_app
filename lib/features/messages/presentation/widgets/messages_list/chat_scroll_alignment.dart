abstract final class ChatScrollAlignment {
  const ChatScrollAlignment._();

  /// Last messages (index = 0).
  static const double latest = .1;

  /// The message is above the center of the screen.
  /// Uses for pinned, reply, search.
  static const double focused = .35;

  /// The message is centered.
  static const double centered = .5;
}

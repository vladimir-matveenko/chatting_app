import 'package:flutter/foundation.dart';

@immutable
class ChatScrollState {
  const ChatScrollState({
    this.firstVisibleIndex,
    this.lastVisibleIndex,
    required this.isLatestVisible,
  });

  const ChatScrollState.initial()
    : firstVisibleIndex = null,
      lastVisibleIndex = null,
      isLatestVisible = true;

  final int? firstVisibleIndex;
  final int? lastVisibleIndex;

  /// Находится ли пользователь возле последних сообщений.
  final bool isLatestVisible;

  ChatScrollState copyWith({
    int? firstVisibleIndex,
    int? lastVisibleIndex,
    bool? isLatestVisible,
  }) {
    return ChatScrollState(
      firstVisibleIndex: firstVisibleIndex ?? this.firstVisibleIndex,
      lastVisibleIndex: lastVisibleIndex ?? this.lastVisibleIndex,
      isLatestVisible: isLatestVisible ?? this.isLatestVisible,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ChatScrollState &&
            firstVisibleIndex == other.firstVisibleIndex &&
            lastVisibleIndex == other.lastVisibleIndex &&
            isLatestVisible == other.isLatestVisible;
  }

  @override
  int get hashCode =>
      Object.hash(firstVisibleIndex, lastVisibleIndex, isLatestVisible);
}

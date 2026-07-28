import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../chat_scroll_alignment.dart';
import '../chat_scroll_state.dart';

class ChatScrollController extends ChangeNotifier {
  ChatScrollController({
    this.scrollDuration = const Duration(milliseconds: 300),
    this.scrollCurve = Curves.easeOut,
    this.latestThreshold = 3,
  }) {
    itemPositionsListener.itemPositions.addListener(_onPositionsChanged);
  }

  final Duration scrollDuration;
  final Curve scrollCurve;

  final int latestThreshold;

  final ItemScrollController itemScrollController = ItemScrollController();

  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  ChatScrollState _state = const ChatScrollState.initial();

  bool _isJumping = false;

  ChatScrollState get state => _state;

  bool get isAttached => itemScrollController.isAttached;

  bool get isJumping => _isJumping;

  int? get firstVisibleIndex => _state.firstVisibleIndex;

  int? get lastVisibleIndex => _state.lastVisibleIndex;

  bool get isLatestVisible => _state.isLatestVisible;

  bool isVisible(int index) {
    return itemPositionsListener.itemPositions.value.any(
      (position) => position.index == index,
    );
  }

  void jumpToLatest() {
    jumpToIndex(0);
  }

  Future<void> animateToLatest() {
    return animateToIndex(0);
  }

  void jumpToIndex(int index, {double alignment = ChatScrollAlignment.latest}) {
    if (!isAttached) return;

    itemScrollController.jumpTo(index: index, alignment: alignment);
  }

  Future<void> animateToIndex(
    int index, {
    double alignment = ChatScrollAlignment.latest,
  }) async {
    if (!isAttached) return;

    _setJumping(true);

    try {
      await itemScrollController.scrollTo(
        index: index,
        alignment: alignment,
        duration: scrollDuration,
        curve: scrollCurve,
      );
    } finally {
      _setJumping(false);
    }
  }

  Future<void> ensureVisible(
    int index, {
    double alignment = ChatScrollAlignment.focused,
  }) async {
    if (isVisible(index)) {
      return;
    }

    await animateToIndex(index, alignment: alignment);
  }

  Future<void> centerOnIndex(int index) {
    return animateToIndex(index, alignment: ChatScrollAlignment.centered);
  }

  void _onPositionsChanged() {
    final positions = itemPositionsListener.itemPositions.value;

    if (positions.isEmpty) {
      return;
    }

    int first = positions.first.index;
    int last = positions.first.index;

    for (final position in positions.skip(1)) {
      if (position.index < first) {
        first = position.index;
      }

      if (position.index > last) {
        last = position.index;
      }
    }

    final latestVisible = positions.any(
      (position) => position.index <= latestThreshold,
    );

    _setState(
      ChatScrollState(
        firstVisibleIndex: first,
        lastVisibleIndex: last,
        isLatestVisible: latestVisible,
      ),
    );
  }

  void _setState(ChatScrollState state) {
    if (_state == state) {
      return;
    }

    _state = state;
    notifyListeners();
  }

  void _setJumping(bool value) {
    if (_isJumping == value) {
      return;
    }

    _isJumping = value;
    notifyListeners();
  }

  @override
  void dispose() {
    itemPositionsListener.itemPositions.removeListener(_onPositionsChanged);

    super.dispose();
  }
}

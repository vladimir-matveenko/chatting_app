import 'package:flutter/material.dart';

import '../controllers/chat_scroll_controller.dart';

class JumpToLatestButton extends StatefulWidget {
  const JumpToLatestButton({
    super.key,
    required this.controller,
    this.threshold = 3,
  });

  final ChatScrollController controller;

  /// После какого количества сообщений,
  /// скрытых снизу, показывать кнопку.
  final int threshold;

  @override
  State<JumpToLatestButton> createState() => _JumpToLatestButtonState();
}

class _JumpToLatestButtonState extends State<JumpToLatestButton> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    widget.controller.itemPositionsListener.itemPositions.addListener(
      _updateVisibility,
    );

    _updateVisibility();
  }

  @override
  void dispose() {
    widget.controller.itemPositionsListener.itemPositions.removeListener(
      _updateVisibility,
    );

    super.dispose();
  }

  void _updateVisibility() {
    final firstVisible = widget.controller.firstVisibleIndex;

    if (firstVisible == null) return;

    final shouldShow = firstVisible > widget.threshold;

    if (shouldShow != _visible) {
      setState(() {
        _visible = shouldShow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
      bottom: 16,
      right: 16,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: _visible ? 1 : 0,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _visible ? 1 : 0,
          child: FloatingActionButton.small(
            heroTag: null,
            backgroundColor: theme.colorScheme.surface,
            foregroundColor: theme.colorScheme.primary,
            onPressed: () {
              widget.controller.jumpToLatest();
            },
            child: const Icon(Icons.keyboard_double_arrow_down),
          ),
        ),
      ),
    );
  }
}

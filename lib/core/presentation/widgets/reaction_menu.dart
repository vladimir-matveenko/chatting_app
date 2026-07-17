import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showReactionsMenu({
  required BuildContext context,
  required GlobalKey messageKey,
  required List<String> reactions,
  required ValueChanged<String> onReactionSelected,
}) {
  final RenderBox? renderBox =
      messageKey.currentContext?.findRenderObject() as RenderBox?;
  if (renderBox == null) return;

  final messagePosition = renderBox.localToGlobal(Offset.zero);
  final messageSize = renderBox.size;
  final screenSize = MediaQuery.of(context).size;
  final statusBarHeight = MediaQuery.of(context).padding.top;

  /// menu size
  const double menuWidth = 120.0;
  const double menuHeight = 50.0;
  const double spacing = 8.0;
  const double horizontalPadding = 16.0;

  /// Y-position
  double topPosition = messagePosition.dy - menuHeight - spacing;
  bool isAbove = true;

  /// if no space at the top - will show below the message
  if (topPosition < statusBarHeight) {
    topPosition = messagePosition.dy + messageSize.height + spacing;
    isAbove = false;
  }

  /// X-position, message is centered
  double leftPosition =
      messagePosition.dx + (messageSize.width / 2) - (menuWidth / 2);

  /// check left position (left padding - 12px)
  if (leftPosition < horizontalPadding) {
    leftPosition = horizontalPadding;
  }

  /// check right position
  if (leftPosition + menuWidth > screenSize.width - horizontalPadding) {
    leftPosition = screenSize.width - menuWidth - horizontalPadding;
  }

  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) {
      return _ReactionsOverlay(
        top: topPosition,
        left: leftPosition,
        menuWidth: menuWidth,
        menuHeight: menuHeight,
        reactions: reactions,
        isAbove: isAbove,
        onClose: () => overlayEntry.remove(),
        onReactionSelected: (reaction) {
          onReactionSelected(reaction);
          overlayEntry.remove();
        },
      );
    },
  );

  HapticFeedback.mediumImpact();
  Overlay.of(context, rootOverlay: true).insert(overlayEntry);
}

class _ReactionsOverlay extends StatefulWidget {
  const _ReactionsOverlay({
    required this.top,
    required this.left,
    required this.menuWidth,
    required this.menuHeight,
    required this.reactions,
    required this.isAbove,
    required this.onClose,
    required this.onReactionSelected,
  });

  final double top;
  final double left;
  final double menuWidth;
  final double menuHeight;
  final List<String> reactions;
  final bool isAbove;
  final VoidCallback onClose;
  final ValueChanged<String> onReactionSelected;

  @override
  State<_ReactionsOverlay> createState() => _ReactionsOverlayState();
}

class _ReactionsOverlayState extends State<_ReactionsOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleClose() async {
    await _animationController.reverse();
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// background
        Positioned.fill(
          child: GestureDetector(
            onTap: _handleClose,
            behavior: HitTestBehavior.translucent,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 150),
              builder: (context, value, child) {
                return ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: value * 4.0,
                      sigmaY: value * 4.0,
                    ),
                    child: Container(
                      color: Colors.black.withValues(alpha: value * 0.15),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        /// menu
        Positioned(
          top: widget.top,
          left: widget.left,
          child: ScaleTransition(
            scale: _scaleAnimation,
            alignment: widget.isAbove
                ? Alignment.bottomCenter
                : Alignment.topCenter,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: widget.menuWidth,
                height: widget.menuHeight,
                padding: const .symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: .circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 15,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: widget.reactions.map((emoji) {
                    return _ReactionItem(
                      emoji: emoji,
                      onTap: () async {
                        HapticFeedback.lightImpact();
                        await _animationController.reverse();
                        widget.onReactionSelected(emoji);
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ReactionItem extends StatefulWidget {
  const _ReactionItem({required this.emoji, required this.onTap});

  final String emoji;
  final VoidCallback onTap;

  @override
  State<_ReactionItem> createState() => _ReactionItemState();
}

class _ReactionItemState extends State<_ReactionItem> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _scale = 1.3),
      onTapUp: (_) => setState(() => _scale = 1.0),
      onTapCancel: () => setState(() => _scale = 1.0),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(widget.emoji, style: const TextStyle(fontSize: 26.0)),
        ),
      ),
    );
  }
}

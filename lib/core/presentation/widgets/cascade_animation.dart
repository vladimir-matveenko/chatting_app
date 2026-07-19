import 'package:flutter/material.dart';

/// Cascade animation. Can be used for adding elements into the list
class CascadeAnimation extends StatelessWidget {
  const CascadeAnimation({
    super.key,
    required this.child,
    required this.elementKey,
    this.duration = 400,
  });

  final Widget child;
  final String elementKey;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      // Unique key provides animation works when list changed
      key: ValueKey(elementKey),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      // Delay for a cascade effect (Staggered animation)
      duration: Duration(milliseconds: duration),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            // Jumping from top to bottom: from -20px to 0px
            offset: Offset(0, -20 * (1.0 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

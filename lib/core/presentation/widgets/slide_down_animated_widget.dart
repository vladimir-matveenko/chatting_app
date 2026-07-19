import 'package:flutter/material.dart';

class SlideDownAnimatedWidget extends StatelessWidget {
  const SlideDownAnimatedWidget({
    super.key,
    required this.child,
    this.duration = 300,
  });

  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: duration),
      transitionBuilder: (child, animation) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        );

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.7),
            end: Offset.zero,
          ).animate(curved),
          child: FadeTransition(opacity: curved, child: child),
        );
      },
      child: child,
    );
  }
}

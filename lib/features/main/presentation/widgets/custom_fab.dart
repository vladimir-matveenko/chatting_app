import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils.dart';

class CustomFab extends StatelessWidget {
  const CustomFab({super.key, required this.state, required this.action});

  final GoRouterState state;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: MainScreenUtils.getFAB(
        context,
        state: state,
        action: action,
      ),
    );
  }
}

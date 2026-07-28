import 'package:flutter/material.dart';

import '../controllers/chat_scroll_controller.dart';

class ScrollToBottomButton extends StatelessWidget {
  const ScrollToBottomButton({super.key, required this.controller});

  final ChatScrollController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final visible = !controller.isLatestVisible;

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            final curved = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutBack,
            );

            return SlideTransition(
              position: Tween(
                begin: const Offset(0, -.7),
                end: Offset.zero,
              ).animate(curved),
              child: FadeTransition(opacity: curved, child: child),
            );
          },
          child: visible
              ? Padding(
                  key: const ValueKey('scrollToBottom'),
                  padding: const EdgeInsets.only(top: 8),
                  child: Center(
                    child: IconButton.outlined(
                      style: IconButton.styleFrom(
                        shape: const CircleBorder(),
                        side: BorderSide(color: theme.colorScheme.primary),
                        backgroundColor: theme
                            .bottomNavigationBarTheme
                            .backgroundColor
                            ?.withValues(alpha: 0.8),
                        foregroundColor: theme.colorScheme.primary,
                      ),
                      onPressed: controller.animateToLatest,
                      icon: const Icon(Icons.arrow_downward_outlined),
                    ),
                  ),
                )
              : const SizedBox(key: ValueKey('empty')),
        );
      },
    );
  }
}

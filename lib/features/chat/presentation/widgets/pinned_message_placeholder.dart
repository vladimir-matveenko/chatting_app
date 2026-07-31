import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PinnedMessagePlaceholder extends StatelessWidget {
  const PinnedMessagePlaceholder({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(12.0),
        color: theme.bottomNavigationBarTheme.backgroundColor,
      ),
      padding: const .all(8.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Row(
          spacing: 4.0,
          crossAxisAlignment: .start,
          children: [
            Icon(Icons.push_pin_rounded, color: theme.colorScheme.primary),
            Text('chatScreen.showPinnedMessages'.tr()),
          ],
        ),
      ),
    );
  }
}

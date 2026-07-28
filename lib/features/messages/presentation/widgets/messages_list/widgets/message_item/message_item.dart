import 'package:flutter/material.dart';

import '../../../../../../../app/utils/extensions.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    this.avatar,
    required this.bubble,
    this.reaction,
    this.isSelected = false,
    this.onTap,
    required this.bubbleAlignment,
  });

  final Widget? avatar;
  final Widget bubble;
  final Widget? reaction;
  final bool isSelected;
  final VoidCallback? onTap;
  final MainAxisAlignment bubbleAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? theme.isDark()
                        ? const Color(0xFF384A6B)
                        : const Color(0xFFC8E6C9)
                  : null,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.translucent,
          child: Row(
            crossAxisAlignment: .start,
            mainAxisAlignment: bubbleAlignment,
            children: [
              if (avatar != null) ...[avatar!, const SizedBox(width: 8)],
              Column(
                crossAxisAlignment: .start,
                children: [
                  bubble,

                  if (reaction != null) ...[
                    const SizedBox(height: 4),
                    reaction!,
                  ],
                ],
              ),
            ],
          ),
        ),
        if (isSelected)
          Positioned(
            left: 16.0,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.check_circle_outline_outlined,
              color: theme.colorScheme.primary,
            ),
          ),
      ],
    );
  }
}

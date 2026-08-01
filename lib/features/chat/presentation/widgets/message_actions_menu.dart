import 'package:chatting_app/app/utils/extensions.dart';
import 'package:flutter/material.dart';

class MessageActionsMenu extends StatelessWidget {
  const MessageActionsMenu({
    super.key,
    required this.onEdit,
    required this.onDelete,
    required this.onPin,
    required this.onReply,
    required this.pinIcon,
    this.isMessageMine = false,
  });

  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onPin;
  final VoidCallback onReply;
  final IconData pinIcon;
  final bool isMessageMine;

  @override
  Widget build(BuildContext context) {
    final isonSize = 16.0;
    final iconColor = Colors.white;
    final theme = Theme.of(context);
    final isDark = theme.isDark();
    return Container(
      padding: const .all(12.0),
      decoration: BoxDecoration(
        color: isDark
            ? theme.bottomNavigationBarTheme.backgroundColor
            : const Color(0xFFC8E6C9),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: .min,
        spacing: 8.0,
        children: [
          if (isMessageMine) ...[
            IconButton(
              onPressed: onPin,
              icon: Icon(pinIcon, size: isonSize, color: iconColor),
            ),
            IconButton(
              onPressed: onEdit,
              icon: Icon(Icons.edit, size: isonSize, color: iconColor),
            ),
            IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.close, size: isonSize, color: iconColor),
            ),
          ],
          IconButton(
            onPressed: onReply,
            icon: Icon(Icons.reply_rounded, size: isonSize, color: iconColor),
          ),
        ],
      ),
    );
  }
}

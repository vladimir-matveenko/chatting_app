import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PinnedMessageItem extends StatelessWidget {
  const PinnedMessageItem({
    super.key,
    required this.message,
    required this.onUnpinTap,
    required this.onNavigateTap,
  });

  final MessageEntity message;
  final Function(int) onUnpinTap;
  final Function(MessageEntity) onNavigateTap;

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
        onTap: () {
          onNavigateTap(message);
        },
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              spacing: 4.0,
              crossAxisAlignment: .start,
              children: [
                Icon(Icons.push_pin_rounded, color: theme.colorScheme.primary),
                Column(
                  spacing: 4.0,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'chatScreen.pinnedMessage'.tr(),
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      message.body ?? '',
                      style: theme.textTheme.bodyMedium,
                      maxLines: 4,
                      overflow: .ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                onUnpinTap(message.id);
              },
              icon: Icon(Icons.close, color: theme.colorScheme.error),
            ),
          ],
        ),
      ),
    );
  }
}

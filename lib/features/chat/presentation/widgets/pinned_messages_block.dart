import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PinnedMessagesBlock extends StatelessWidget {
  const PinnedMessagesBlock({super.key, required this.pinnedMessages});

  final List<MessageEntity> pinnedMessages;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(12.0),
        color: theme.bottomNavigationBarTheme.backgroundColor,
      ),
      padding: const .all(8.0),
      child: Row(
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
                pinnedMessages.last.body ?? '',
                style: theme.textTheme.bodyMedium,
                maxLines: 4,
                overflow: .ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

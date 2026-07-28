import 'package:chatting_app/features/messages/domain/entity/message_sender_entity.dart';
import 'package:flutter/material.dart';

class MessageSender extends StatelessWidget {
  const MessageSender({super.key, required this.sender});

  final MessageSenderEntity sender;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        sender.displayName ?? sender.userName,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

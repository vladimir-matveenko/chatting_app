import 'package:chatting_app/features/messages/domain/entity/message_sender_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entity/message_reply_entity.dart';
import 'message_content.dart';
import 'message_sender.dart';
import 'message_status.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.bubbleKey,
    required this.text,
    required this.updatedAt,
    required this.timeFormatter,
    this.bubbleColor,
    required this.showSender,
    required this.sender,
    this.reply,
    required this.isEdited,
    required this.showReadIndicator,
    required this.onTap,
    this.onLongPress,
    this.isHighlighted = false,
    this.padding = const EdgeInsets.all(8),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.border,
  });

  final GlobalKey bubbleKey;
  final String? text;
  final DateTime updatedAt;
  final DateFormat timeFormatter;
  final MessageSenderEntity sender;
  final MessageReplyEntity? reply;
  final bool showSender;
  final bool isEdited;
  final bool showReadIndicator;
  final Color? bubbleColor;
  final bool isHighlighted;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final Border? border;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: AnimatedContainer(
        key: bubbleKey,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        padding: padding,
        decoration: BoxDecoration(
          color: isHighlighted ? colorScheme.primaryContainer : bubbleColor,
          borderRadius: borderRadius,
          border: border,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (reply != null)
              Container(
                padding: const .all(8.0),
                margin: const .only(bottom: 8.0),
                decoration: BoxDecoration(
                  borderRadius: .circular(8.0),
                  color: theme.bottomNavigationBarTheme.backgroundColor,
                ),
                child: Column(
                  spacing: 4.0,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      reply?.sender.displayName ?? reply?.sender.userName ?? '',
                      style: textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Text(
                      reply?.body ?? '',
                      style: textTheme.bodySmall,
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                  ],
                ),
              ),

            if (showSender) MessageSender(sender: sender),

            MessageContent(text: text),

            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerRight,
              child: MessageStatus(
                updatedAt: updatedAt,
                timeFormatter: timeFormatter,
                isEdited: isEdited,
                showReadIndicator: showReadIndicator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

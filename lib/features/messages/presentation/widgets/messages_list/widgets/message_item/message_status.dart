import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MessageStatus extends StatelessWidget {
  const MessageStatus({
    super.key,
    required this.updatedAt,
    required this.timeFormatter,
    required this.isEdited,
    required this.showReadIndicator,
  });

  final DateTime updatedAt;
  final DateFormat timeFormatter;

  final bool isEdited;
  final bool showReadIndicator;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isEdited) ...[
          Text(
            'chatScreen.edited'.tr(),
            style: textTheme.bodySmall?.copyWith(fontSize: 10),
          ),
          const SizedBox(width: 4),
        ],
        Text(timeFormatter.format(updatedAt), style: textTheme.bodySmall),
        if (showReadIndicator) ...[
          const SizedBox(width: 4),
          Icon(Icons.done_all, size: 14, color: colorScheme.primary),
        ],
      ],
    );
  }
}

import 'package:chatting_app/features/profile/presentation/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class ChatInfoWidget extends StatelessWidget {
  const ChatInfoWidget({
    super.key,
    required this.avatar,
    required this.title,
    this.membersCount,
  });

  final String avatar;
  final String title;
  final String? membersCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        UserAvatar(avatar: avatar, firstName: title, size: 80.0),
        const SizedBox(height: 16.0),
        Text(title, style: theme.textTheme.bodyMedium),
        const SizedBox(height: 4.0),
        if (membersCount != null) ...[
          Text(membersCount!, style: theme.textTheme.bodySmall),
        ],
      ],
    );
  }
}

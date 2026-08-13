import 'package:flutter/material.dart';

import '../../../features/chat/presentation/widgets/user_online_indicator.dart';
import '../../../features/profile/presentation/widgets/user_avatar.dart';

class AvatarWithName extends StatelessWidget {
  const AvatarWithName({
    super.key,
    this.avatar,
    required this.userName,
    this.isOnline = false,
  });

  final String? avatar;
  final String userName;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: .start,
      children: [
        UserAvatar(
          size: 30.0,
          avatar: avatar ?? '',
          firstName: userName,
          lastName: '',
        ),
        if (isOnline) const UserOnlineIndicator(baseUserAvatarSize: 30.0),
        SizedBox(width: isOnline ? 4 : 12),
        Text(userName, style: textTheme.bodyMedium),
      ],
    );
  }
}

import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/features/profile/presentation/widgets/user_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'user_online_indicator.dart';

class ChatInfoWidget extends StatelessWidget {
  const ChatInfoWidget({
    super.key,
    required this.avatar,
    required this.title,
    this.membersCount,
    required this.isOnline,
    required this.chatType,
  });

  final String avatar;
  final String title;
  final String? membersCount;
  final bool isOnline;
  final ChatType chatType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPrivate = chatType == ChatType.private;
    return isPrivate
        ? Column(
            children: [
              Row(
                children: [
                  UserAvatar(avatar: avatar, firstName: title, size: 80.0),
                  if (isOnline)
                    const UserOnlineIndicator(
                      baseUserAvatarSize: 80.0,
                      indicatorSize: 12.0,
                    ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(title, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 4.0),
              Text(
                isOnline ? 'chatScreen.online'.tr() : 'chatScreen.offline'.tr(),
                style: theme.textTheme.bodySmall,
              ),
            ],
          )
        : Column(
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

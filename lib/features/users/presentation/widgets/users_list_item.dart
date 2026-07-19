import 'package:flutter/material.dart';

import '../../../profile/presentation/widgets/user_avatar.dart';
import '../../domain/entity/users_list_item_entity.dart';

class UsersListItem extends StatelessWidget {
  const UsersListItem({super.key, required this.onTap, required this.user});

  final UserListItemEntity user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final userName = user.displayName ?? user.userName;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          spacing: 8.0,
          mainAxisAlignment: .start,
          children: [
            UserAvatar(
              size: 30.0,
              avatar: user.avatarUrl ?? '',
              firstName: userName,
              lastName: '',
            ),
            Text(userName, style: textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

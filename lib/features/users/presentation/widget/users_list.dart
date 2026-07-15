import 'package:chatting_app/features/profile/presentation/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../chats/presentation/chat_cubit/cubit.dart';
import '../../domain/entity/users_list_item_entity.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key, required this.users});

  final List<UserListItemEntity> users;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      itemCount: users.length,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListItem(
          key: ValueKey(user.id),
          onTap: () {
            context.read<ChatCubit>().createChat(
              type: ChatType.private,
              memberIds: [user.id],
              shouldNavigate: true,
            );
          },
          user: user,
        );
      },
      separatorBuilder: (context, index) => Divider(
        height: 16.0,
        thickness: 1.0,
        color: theme.unselectedWidgetColor,
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.onTap, required this.user});

  final UserListItemEntity user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final userName = user.displayName ?? user.id;

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
              size: 20.0,
              avatar: user.avatarUrl ?? '',
              firstName: userName,
            ),
            Text(userName, style: textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

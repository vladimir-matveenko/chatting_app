import 'package:chatting_app/features/users/presentation/widgets/users_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../app/router/app_routes.dart';
import '../../../chat/presentation/cubit/cubit.dart';
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
        return UsersListItem(
          key: ValueKey(user.id),
          onTap: () {
            if (user.privateChatId?.isNotEmpty == true) {
              context.go('${AppRoutes.chats}/${user.privateChatId!}');
            } else {
              context.read<ChatCubit>().createChat(
                type: ChatType.private,
                memberIds: [user.id],
                shouldNavigate: true,
              );
            }
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

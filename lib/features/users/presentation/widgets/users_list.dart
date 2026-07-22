import 'package:chatting_app/core/presentation/widgets/base_list_view.dart';
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
    final cubit = context.read<ChatCubit>();
    return BaseListView<UserListItemEntity>(
      items: users,
      itemBuilder: (context, index) {
        final user = users[index];
        return UsersListItem(
          key: ValueKey(user.id),
          onTap: () {
            if (user.privateChatId?.isNotEmpty == true) {
              cubit.getChatById(user.privateChatId!);
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
    );
  }
}

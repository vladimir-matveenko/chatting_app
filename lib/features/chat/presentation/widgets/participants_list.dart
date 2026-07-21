import 'package:chatting_app/core/presentation/widgets/base_list_view.dart';
import 'package:flutter/material.dart';

import '../../../users/domain/entity/users_list_item_entity.dart';
import '../../../users/presentation/widgets/users_list_item.dart';

class ParticipantsList extends StatelessWidget {
  const ParticipantsList({
    super.key,
    required this.participants,
    required this.onAddTap,
  });

  final List<UserListItemEntity> participants;
  final Function(UserListItemEntity) onAddTap;

  @override
  Widget build(BuildContext context) {
    return BaseListView<UserListItemEntity>(
      items: participants,
      itemBuilder: (context, index) {
        final user = participants[index];
        return UsersListItem(
          key: ValueKey(user.id),
          onTap: () {
            onAddTap(user);
          },
          user: user,
        );
      },
    );
  }
}

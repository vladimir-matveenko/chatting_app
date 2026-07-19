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
    final theme = Theme.of(context);
    return ListView.separated(
      itemCount: participants.length,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      shrinkWrap: true,
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
      separatorBuilder: (context, index) => Divider(
        height: 16.0,
        thickness: 1.0,
        color: theme.unselectedWidgetColor,
      ),
    );
  }
}

import 'package:chatting_app/features/users/domain/entity/users_list_item_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/cascade_animation.dart';

class AddedParticipantsList extends StatelessWidget {
  const AddedParticipantsList({
    super.key,
    required this.participants,
    required this.onTap,
  });

  final List<UserListItemEntity> participants;
  final Function(UserListItemEntity) onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: participants.map((participant) {
        return CascadeAnimation(
          elementKey: participant.id,
          duration: 500,
          child: GestureDetector(
            key: ValueKey(participant.id),
            onTap: () {
              onTap(participant);
            },
            child: ParticipantListItem(participant: participant),
          ),
        );
      }).toList(),
    );
  }
}

class ParticipantListItem extends StatelessWidget {
  const ParticipantListItem({super.key, required this.participant});

  final UserListItemEntity participant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Chip(
      label: Text(
        participant.displayName ?? participant.userName,
        style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
      ),
    );
  }
}

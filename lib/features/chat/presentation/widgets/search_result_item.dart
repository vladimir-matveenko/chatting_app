import 'package:chatting_app/features/messages/domain/entity/message_search_result_entity.dart';
import 'package:chatting_app/features/profile/presentation/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key, required this.item, required this.onTap});

  final MessageSearchResultEntity item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      behavior: .translucent,
      onTap: onTap,
      child: Row(
        spacing: 8.0,
        children: [
          UserAvatar(
            avatar: item.sender.avatarUrl ?? '',
            firstName: item.sender.displayName ?? item.sender.userName,
          ),
          Column(
            spacing: 4.0,
            crossAxisAlignment: .start,
            children: [
              Text(
                item.sender.displayName ?? item.sender.userName,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              Text(
                item.body ?? '',
                style: theme.textTheme.bodySmall,
                maxLines: 2,
                overflow: .ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

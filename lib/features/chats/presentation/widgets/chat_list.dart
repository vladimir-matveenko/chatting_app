import 'package:chatting_app/app/router/app_routes.dart';
import 'package:chatting_app/app/utils/extensions.dart';
import 'package:chatting_app/core/presentation/widgets/avatar_stack.dart';
import 'package:chatting_app/core/presentation/widgets/base_list_view.dart';
import 'package:chatting_app/features/chat/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key, required this.chats});

  final List<ChatListItemEntity> chats;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    return BaseListView(
      items: chats,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListItem(
          key: ValueKey(chat.id),
          onTap: () {
            cubit.getChatById(chat.id);
            context.go('${AppRoutes.chats}/${chat.id}');
          },
          chat: chat,
        );
      },
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.onTap, required this.chat});

  final ChatListItemEntity chat;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatars = chat.participants.map((e) => e.avatarUrl ?? '').toList();
    final names = chat.participants.map((e) => e.userName).toList();

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          spacing: 8.0,
          mainAxisAlignment: .start,
          crossAxisAlignment: .center,
          children: [
            AvatarStack(
              avatarSize: 30.0,
              imageUrls: avatars,
              names: names,
              placeholderBackgroundColor: theme.unselectedWidgetColor,
              borderColor: theme.isDark() ? Colors.white : Colors.grey.shade500,
            ),
            if (chat.participantsCount > 2)
              Text(
                '+${chat.participantsCount - 2}',
                style: theme.textTheme.bodyMedium,
              ),
            if (chat.title?.isNotEmpty == true)
              Text(chat.title!, style: theme.textTheme.bodyMedium)
            else if (chat.participantsCount == 2)
              Text(
                chat.participants.first.displayName ??
                    chat.participants.first.userName,
                style: theme.textTheme.bodyMedium,
              ),
            if (chat.unreadCount > 0) ...[
              Chip(
                label: Text(
                  chat.unreadCount.toString(),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              if (chat.lastMessagePreview?.isNotEmpty == true)
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 120.0),
                  child: Text(
                    chat.lastMessagePreview!,
                    style: theme.textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

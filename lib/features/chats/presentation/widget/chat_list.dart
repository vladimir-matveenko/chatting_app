import 'package:chatting_app/app/router/app_routes.dart';
import 'package:chatting_app/core/presentation/widgets/avatar_stack.dart';
import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key, required this.chats});

  final List<ChatListItemEntity> chats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      itemCount: chats.length,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListItem(
          key: ValueKey(chat.id),
          onTap: () {
            context.go('${AppRoutes.chats}/${chat.id}');
          },
          chat: chat,
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
  const ListItem({super.key, required this.onTap, required this.chat});

  final ChatListItemEntity chat;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final avatars = chat.participants.map((e) => e.avatarUrl ?? '').toList();
    final names = chat.participants.map((e) => e.username).toList();

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          spacing: 4.0,
          mainAxisAlignment: .start,
          children: [
            AvatarStack(avatarSize: 30.0, imageUrls: avatars, names: names),
            if (chat.participantsCount > 2)
              Text(
                '+${chat.participantsCount - 1}',
                style: textTheme.bodySmall,
              ),
            if (chat.title?.isNotEmpty == true)
              Text(chat.title!)
            else if (chat.participantsCount == 2)
              Text(chat.participants.first.username),
          ],
        ),
      ),
    );
  }
}

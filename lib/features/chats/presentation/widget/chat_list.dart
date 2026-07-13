import 'package:chatting_app/app/router/app_routes.dart';
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

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          spacing: 8.0,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              chat.id,
              style: textTheme.bodySmall?.copyWith(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}

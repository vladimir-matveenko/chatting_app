import 'package:chatting_app/app/router/app_routes.dart';
import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/app/utils/extensions.dart';
import 'package:chatting_app/core/presentation/widgets/app_loader.dart';
import 'package:chatting_app/core/presentation/widgets/avatar_stack.dart';
import 'package:chatting_app/core/presentation/widgets/base_list_view.dart';
import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  bool _imagesReady = false;
  bool _imagesInProgress = false;

  Future<void> _precacheAvatars(
    BuildContext context,
    List<ChatListItemEntity> chats,
  ) async {
    _imagesInProgress = true;
    final images = chats
        .take(10)
        .expand((chat) => chat.participants)
        .map((participant) => participant.avatarUrl)
        .whereType<String>()
        .where((url) => url.trim().isNotEmpty)
        .toSet()
        .toList();

    await AppUtils.precacheImages(context, images: images);

    if (!mounted) return;

    setState(() {
      _imagesInProgress = false;
      _imagesReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        final chats = state.status == ChatsScreenStatus.active
            ? state.chats
            : state.archivedChats;

        if (!_imagesReady && !_imagesInProgress && state.chats.isNotEmpty) {
          _precacheAvatars(context, chats);
        }
        final isLoading = state.isLoading || !_imagesReady;
        return isLoading
            ? const Center(child: AppLoader())
            : chats.isNotEmpty
            ? BaseListView(
                controller: widget.scrollController,
                items: chats,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return ListItem(
                    key: ValueKey(chat.id),
                    slideableAction: () {
                      final chatsCubit = context.read<ChatsCubit>();
                      if (state.status == ChatsScreenStatus.active) {
                        chatsCubit.archiveChat(chat.id);
                      } else {
                        chatsCubit.returnFromArchiveChat(chat.id);
                      }
                    },
                    icon: state.status == ChatsScreenStatus.archive
                        ? Icons.unarchive_rounded
                        : Icons.archive_rounded,
                    onTap: () {
                      context.go('${AppRoutes.chats}/${chat.id}');
                    },
                    chat: chat,
                  );
                },
              )
            : Center(child: Text('errors.noData'.tr()));
      },
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.onTap,
    required this.chat,
    required this.slideableAction,
    required this.icon,
  });

  final ChatListItemEntity chat;
  final VoidCallback onTap;
  final VoidCallback slideableAction;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatars = chat.participants.map((e) => e.avatarUrl ?? '').toList();
    final names = chat.participants.map((e) => e.userName).toList();
    final isLandscape = context.isLandscape();
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Slidable(
        key: ValueKey(chat.id),
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          extentRatio: isLandscape ? 0.2 : 0.3,
          children: [
            SlidableAction(
              onPressed: (context) {
                slideableAction.call();
              },
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              icon: icon,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ],
        ),
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
              borderColor: theme.isDark ? Colors.white : Colors.grey.shade500,
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
                  style: theme.textTheme.titleLarge?.copyWith(fontSize: 12.0),
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

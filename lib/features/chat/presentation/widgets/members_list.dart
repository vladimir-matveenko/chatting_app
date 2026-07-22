import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/app/utils/extensions.dart';
import 'package:chatting_app/core/presentation/widgets/base_list_view.dart';
import 'package:chatting_app/features/chat/domain/entity/chat_member_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/presentation/widgets/app_dialog.dart';
import '../../../profile/presentation/widgets/user_avatar.dart';

class MembersList extends StatelessWidget {
  const MembersList({
    super.key,
    required this.participants,
    required this.onDeleteTap,
  });

  final List<ChatMemberEntity> participants;
  final Function(ChatMemberEntity) onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return BaseListView<ChatMemberEntity>(
      items: participants,
      itemBuilder: (context, index) {
        final user = participants[index];
        return MembersListItem(
          key: ValueKey(user.userId),
          action: () {
            onDeleteTap(user);
          },
          user: user,
          isOwner: user.role == ChatMemberRole.owner,
        );
      },
    );
  }
}

class MembersListItem extends StatelessWidget {
  const MembersListItem({
    super.key,
    required this.action,
    required this.user,
    this.isOwner = false,
  });

  final ChatMemberEntity user;
  final VoidCallback action;
  final bool isOwner;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final userName = user.displayName ?? user.userName;
    final isLandscape = context.isLandscape();

    return Slidable(
      key: ValueKey(user.userId),
      enabled: !isOwner,
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: isLandscape ? 0.2 : 0.3,
        children: [
          SlidableAction(
            onPressed: (context) async {
              final result = await AppDialog.show(
                context,
                title: 'chatScreen.members.removeMember'.tr(),
                text: 'chatScreen.members.areYouSure'.tr(),
                cancelText: 'cancelText'.tr(),
                okText: 'okText'.tr(),
              );
              if (result) {
                action.call();
              }
            },
            backgroundColor: colorScheme.error,
            foregroundColor: colorScheme.onError,
            icon: Icons.delete_forever,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              spacing: 8.0,
              mainAxisAlignment: .start,
              children: [
                UserAvatar(
                  size: 30.0,
                  avatar: user.avatarUrl ?? '',
                  firstName: userName,
                  lastName: '',
                ),
                Text(userName, style: textTheme.bodyMedium),
              ],
            ),
            if (isOwner)
              Text(
                'chatScreen.owner'.tr(),
                style: textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

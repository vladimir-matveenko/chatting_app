import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../app/utils/extensions.dart';
import '../../../../core/presentation/widgets/app_dialog.dart';
import '../../../../core/presentation/widgets/avatar_with_name.dart';
import '../../domain/entity/chat_member_entity.dart';

class MembersListItem extends StatelessWidget {
  const MembersListItem({
    super.key,
    required this.user,
    this.swipeLeftAction,
    this.swipeRightAction,
    this.areYou = false,
  });

  final ChatMemberEntity user;
  final VoidCallback? swipeLeftAction;
  final VoidCallback? swipeRightAction;
  final bool areYou;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final userName = user.displayName ?? user.userName;
    final isLandscape = context.isLandscape();
    final isOwner = user.role.isOwner;
    final isAdmin = user.role.isAdmin;

    return Slidable(
      key: ValueKey(user.userId),
      // swipe right
      startActionPane: swipeRightAction != null
          ? ActionPane(
              motion: const BehindMotion(),
              extentRatio: isLandscape ? 0.2 : 0.3,
              children: [
                SlidableAction(
                  onPressed: (_) {
                    swipeRightAction!.call();
                  },
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  label: isAdmin
                      ? 'editChatScreen.disableAdmin'.tr()
                      : 'editChatScreen.makeAdmin'.tr(),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ],
            )
          : null,
      // swipe left
      endActionPane: swipeLeftAction != null
          ? ActionPane(
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
                      swipeLeftAction!.call();
                    }
                  },
                  backgroundColor: colorScheme.error,
                  foregroundColor: colorScheme.onError,
                  icon: Icons.delete_forever,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ],
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              spacing: 4.0,
              children: [
                AvatarWithName(
                  avatar: user.avatarUrl ?? '',
                  userName: userName,
                  isOnline: user.isOnline,
                ),
                if (areYou)
                  Text('(${'you'.tr()})', style: textTheme.bodyMedium),
              ],
            ),
            if (isOwner)
              Text(
                'chatScreen.owner'.tr(),
                style: textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              )
            else if (isAdmin)
              Text(
                'chatScreen.admin'.tr(),
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

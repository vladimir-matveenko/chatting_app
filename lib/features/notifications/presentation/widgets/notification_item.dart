import 'package:chatting_app/features/notifications/domain/entity/notification_entity.dart';
import 'package:chatting_app/features/notifications/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../app/theme/app_semantic_colors.dart';
import '../../../../app/utils/extensions.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notification,
    required this.onTap,
    required this.slideableAction,
  });

  final NotificationEntity notification;
  final VoidCallback onTap;
  final VoidCallback slideableAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLandscape = context.isLandscape();
    final colorScheme = theme.colorScheme;
    final colors = Theme.of(context).extension<AppSemanticColors>()!;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Slidable(
        key: ValueKey(notification.id),
        enabled: !notification.isRead,
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          extentRatio: isLandscape ? 0.2 : 0.3,
          children: [
            SlidableAction(
              onPressed: (context) {
                slideableAction.call();
              },
              backgroundColor: colors.success,
              foregroundColor: colorScheme.onPrimary,
              icon: Icons.check_circle_outline_outlined,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            spacing: 8.0,
            mainAxisAlignment: .spaceBetween,
            crossAxisAlignment: .center,
            children: [
              NotificationsUtils.getNotificationBody(
                notification: notification,
                textStyle: theme.textTheme.bodyMedium!,
                smallTextStyle: theme.textTheme.bodySmall!,
              ),
              if (!notification.isRead)
                Icon(Icons.new_releases, size: 16.0, color: colors.success),
            ],
          ),
        ),
      ),
    );
  }
}

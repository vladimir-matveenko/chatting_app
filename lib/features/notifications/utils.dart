import 'package:chatting_app/features/notifications/domain/entity/notification_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'data/enums/notification_type.dart';

@immutable
class NotificationsUtils {
  const NotificationsUtils._();

  static IconData getNotificationTypeIcon(NotificationType type) {
    return switch (type) {
      NotificationType.message => Icons.chat_bubble_outline,
      NotificationType.chatUpdated => Icons.edit_outlined,
      NotificationType.adminGranted => Icons.admin_panel_settings_outlined,
      NotificationType.adminRevoked => Icons.remove_moderator_outlined,
      NotificationType.memberAdded => Icons.person_add_alt_1_outlined,
      NotificationType.memberRemoved => Icons.person_remove_outlined,
      NotificationType.chatInvite => Icons.group_add_outlined,
      NotificationType.ownerChanged => Icons.stars_outlined,
      NotificationType.reaction => Icons.emoji_emotions_outlined,
      NotificationType.reply => Icons.reply_outlined,
    };
  }

  static String getNotificationTypeText(NotificationType type) {
    return switch (type) {
      NotificationType.message => 'notificationsScreen.bodyText.message'.tr(),
      NotificationType.chatUpdated =>
        'notificationsScreen.bodyText.chatUpdated'.tr(),
      NotificationType.adminGranted =>
        'notificationsScreen.bodyText.adminGranted'.tr(),
      NotificationType.adminRevoked =>
        'notificationsScreen.bodyText.adminRevoked'.tr(),
      NotificationType.memberAdded =>
        'notificationsScreen.bodyText.memberAdded'.tr(),
      NotificationType.memberRemoved =>
        'notificationsScreen.bodyText.memberRemoved'.tr(),
      NotificationType.chatInvite =>
        'notificationsScreen.bodyText.chatInvite'.tr(),
      NotificationType.ownerChanged =>
        'notificationsScreen.bodyText.ownerChanged'.tr(),
      NotificationType.reaction => 'notificationsScreen.bodyText.reaction'.tr(),
      NotificationType.reply => 'notificationsScreen.bodyText.reply'.tr(),
    };
  }

  static Widget getNotificationBody({
    required NotificationEntity notification,
    required TextStyle textStyle,
    required TextStyle smallTextStyle,
    required DateFormat timeFormatter,
  }) {
    var icon = getNotificationTypeIcon(notification.type);
    var text = getNotificationTypeText(notification.type);
    return Row(
      spacing: 8.0,
      children: [
        Icon(icon, size: 24.0),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(text, style: textStyle),
            Text(
              timeFormatter.format(notification.createdAt),
              style: smallTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}

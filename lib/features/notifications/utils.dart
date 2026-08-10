import 'package:chatting_app/features/notifications/domain/entity/notification_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../app/constants/app_enums.dart';

@immutable
class NotificationsUtils {
  const NotificationsUtils._();

  static List<NotificationEntity> mergeNotifications(
    List<NotificationEntity> current,
    List<NotificationEntity> incoming,
  ) {
    final map = <String, NotificationEntity>{
      for (final m in current) m.id: m,
      for (final m in incoming) m.id: m,
    };

    final result = map.values.toList()..sort((a, b) => a.id.compareTo(b.id));

    return result;
  }

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

  static Widget getNotificationBody({
    required NotificationEntity notification,
    required TextStyle textStyle,
    required TextStyle smallTextStyle,
    required DateFormat timeFormatter,
  }) {
    var icon = getNotificationTypeIcon(notification.type);
    var text = '';
    switch (notification.type) {
      case NotificationType.message:
        text = 'notificationsScreen.bodyText.message'.tr();
        break;
      case NotificationType.chatUpdated:
        text = 'notificationsScreen.bodyText.chatUpdated'.tr();
        break;
      case NotificationType.adminGranted:
        text = 'notificationsScreen.bodyText.adminGranted'.tr();
        break;
      case NotificationType.adminRevoked:
        text = 'notificationsScreen.bodyText.adminRevoked'.tr();
        break;
      case NotificationType.memberAdded:
        text = 'notificationsScreen.bodyText.memberAdded'.tr();
        break;
      case NotificationType.memberRemoved:
        text = 'notificationsScreen.bodyText.memberRemoved'.tr();
        break;
      case NotificationType.chatInvite:
        text = 'notificationsScreen.bodyText.chatInvite'.tr();
        break;
      case NotificationType.ownerChanged:
        text = 'notificationsScreen.bodyText.ownerChanged'.tr();
        break;
      case NotificationType.reaction:
        text = 'notificationsScreen.bodyText.reaction'.tr();
        break;
      case NotificationType.reply:
        text = 'notificationsScreen.bodyText.reply'.tr();
        break;
    }
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

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

  static Widget getNotificationBody({
    required NotificationEntity notification,
    required TextStyle textStyle,
    required TextStyle smallTextStyle,
    required DateFormat timeFormatter,
  }) {
    var icon = Icons.info;
    var text = '';
    switch (notification.type) {
      case NotificationType.message:
        icon = Icons.chat_bubble_outline;
        text = 'notificationsScreen.bodyText.message'.tr();
        break;
      case NotificationType.chatUpdated:
        icon = Icons.edit_outlined;
        text = 'notificationsScreen.bodyText.chatUpdated'.tr();
        break;
      case NotificationType.adminGranted:
        icon = Icons.admin_panel_settings_outlined;
        text = 'notificationsScreen.bodyText.adminGranted'.tr();
        break;
      case NotificationType.adminRevoked:
        icon = Icons.remove_moderator_outlined;
        text = 'notificationsScreen.bodyText.adminRevoked'.tr();
        break;
      case NotificationType.memberAdded:
        icon = Icons.person_add_alt_1_outlined;
        text = 'notificationsScreen.bodyText.memberAdded'.tr();
        break;
      case NotificationType.memberRemoved:
        icon = Icons.person_remove_outlined;
        text = 'notificationsScreen.bodyText.memberRemoved'.tr();
        break;
      case NotificationType.chatInvite:
        icon = Icons.group_add_outlined;
        text = 'notificationsScreen.bodyText.chatInvite'.tr();
        break;
      case NotificationType.ownerChanged:
        icon = Icons.stars_outlined;
        text = 'notificationsScreen.bodyText.ownerChanged'.tr();
        break;
      case NotificationType.reaction:
        icon = Icons.emoji_emotions_outlined;
        text = 'notificationsScreen.bodyText.reaction'.tr();
        break;
      case NotificationType.reply:
        icon = Icons.reply_outlined;
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

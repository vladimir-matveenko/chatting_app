import 'package:chatting_app/app/utils/extensions.dart';
import 'package:chatting_app/features/chat/domain/entity/chat_entity.dart';
import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:chatting_app/features/messages/presentation/widgets/messages_list/controllers/chat_scroll_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../app/utils/app_utils.dart';

@immutable
class MessagesUtils {
  const MessagesUtils._();

  static String formatDate(BuildContext context, {required DateTime dateTime}) {
    final now = DateTime.now();
    if (dateTime.isSameDay(now)) {
      return 'today'.tr();
    }
    final date = DateFormat(
      'dd MMMM',
      context.locale.languageCode,
    ).format(dateTime);
    if (dateTime.year == now.year) {
      return date;
    }
    final year = DateFormat(
      'yyyy',
      context.locale.languageCode,
    ).format(dateTime);
    return '$date $year';
  }

  static bool isEnoughVisible(ItemPosition position) {
    const visibleThreshold = 0.5;

    final visibleTop = position.itemLeadingEdge.clamp(0.0, 1.0);
    final visibleBottom = position.itemTrailingEdge.clamp(0.0, 1.0);

    final visibleFraction = visibleBottom - visibleTop;

    return visibleFraction >= visibleThreshold;
  }

  static int? getMaxVisibleUnreadMessageId({
    required ChatScrollController scrollController,
    required ChatEntity chat,
    required List<MessageEntity> messages,
    required String currentUserId,
  }) {
    if (scrollController.isJumping) {
      return null;
    }

    final positions =
        scrollController.itemPositionsListener.itemPositions.value;

    if (positions.isEmpty) {
      return null;
    }

    final lastReadMessageId = chat.lastReadMessageId ?? -1;

    int maxVisibleId = 0;

    for (final position in positions) {
      if (!isEnoughVisible(position)) {
        continue;
      }

      final index = position.index;

      if (index < 0 || index >= messages.length) {
        continue;
      }

      final message = messages[index];

      final isIncoming = message.sender.id != currentUserId;

      if (!isIncoming) {
        continue;
      }

      if (message.id <= lastReadMessageId) {
        continue;
      }

      if (message.id > maxVisibleId) {
        maxVisibleId = message.id;
      }
    }

    return maxVisibleId > 0 ? maxVisibleId : null;
  }

  static Widget? getReactionWidget(
    BuildContext context, {
    required MessageEntity message,
    VoidCallback? onTap,
  }) {
    if (message.reactions.isEmpty && message.currentUserReaction == null) {
      return null;
    }
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyMedium;
    List<Widget> reactions = [];
    if (message.reactions.isNotEmpty) {
      reactions = message.reactions.map((e) {
        final youReacted = e.type == message.currentUserReaction;
        return GestureDetector(
          onTap: onTap,
          child: Chip(
            backgroundColor: youReacted && e.count > 1
                ? theme.colorScheme.primary
                : null,
            label: Row(
              spacing: 4.0,
              children: [
                Text(
                  AppUtils.getReactionSymbol(e.type),
                  style: textStyle?.copyWith(fontSize: 18.0),
                ),
                if (e.count > 1)
                  Text(
                    e.count.toString(),
                    style: textStyle?.copyWith(
                      color: youReacted ? theme.colorScheme.onPrimary : null,
                    ),
                  ),
              ],
            ),
          ),
        );
      }).toList();
    }

    return Row(spacing: 4.0, children: reactions);
  }
}

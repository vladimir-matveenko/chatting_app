import 'package:chatting_app/features/chat/domain/entity/chat_entity.dart';
import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:chatting_app/features/messages/presentation/widgets/messages_list/controllers/chat_scroll_controller.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

@immutable
class MessagesUtils {
  const MessagesUtils._();

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
}

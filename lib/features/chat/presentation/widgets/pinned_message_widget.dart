import 'package:chatting_app/features/chat/presentation/widgets/pinned_message_item.dart';
import 'package:chatting_app/features/chat/presentation/widgets/pinned_message_placeholder.dart';
import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:flutter/material.dart';

class PinnedMessageWidget extends StatelessWidget {
  const PinnedMessageWidget({
    super.key,
    required this.messages,
    required this.onUnpinTap,
    required this.onNavigateTap,
    required this.onShowModalTap,
  });

  final List<MessageEntity> messages;
  final Function(int) onUnpinTap;
  final Function(MessageEntity) onNavigateTap;
  final VoidCallback onShowModalTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(top: 16.0, left: 16.0, right: 16.0),
      child: messages.length == 1
          ? PinnedMessageItem(
              onUnpinTap: onUnpinTap,
              onNavigateTap: onNavigateTap,
              message: messages.first,
            )
          : PinnedMessagePlaceholder(onTap: onShowModalTap),
    );
  }
}

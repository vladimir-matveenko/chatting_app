import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app/utils/extensions.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({
    super.key,
    required this.messages,
    required this.scrollController,
    required this.currentUserId,
  });

  final List<MessageEntity> messages;
  final ScrollController scrollController;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final formatter = DateFormat('yyyy.MM.dd', context.locale.languageCode);

    return ListView.separated(
      controller: scrollController,
      itemCount: messages.length,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      shrinkWrap: true,
      reverse: true,
      itemBuilder: (context, index) {
        final message = messages[index];
        final messageColor = isDark
            ? Colors.grey.shade200
            : Colors.grey.shade400;

        final current = message.createdAt;

        final nextIndex = index + 1;
        final hasNext = nextIndex < messages.length;
        final next = hasNext ? messages[nextIndex].createdAt : null;

        final shouldShowDate = next == null || !current.isSameDay(next);

        return Column(
          children: [
            if (shouldShowDate)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, top: 12.0),
                child: Align(
                  alignment: .center,
                  child: Text(formatter.format(current)),
                ),
              ),
            ListItem(
              key: ValueKey(message.id),
              message: message,
              currentUserId: currentUserId,
              messageColor: messageColor,
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12.0),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.message,
    required this.currentUserId,
    required this.messageColor,
  });

  final MessageEntity message;
  final String currentUserId;
  final Color messageColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final itsMe = currentUserId == message.senderId;

    return Row(
      spacing: 8.0,
      mainAxisAlignment: itsMe ? .end : .start,
      children: [
        Container(
          padding: const .all(8.0),
          decoration: BoxDecoration(
            border: itsMe ? null : Border.all(color: messageColor),
            borderRadius: BorderRadius.circular(12.0),
            color: itsMe ? messageColor : null,
          ),
          child: Column(
            spacing: 8.0,
            crossAxisAlignment: .start,
            children: [
              Text(
                message.body ?? '',
                style: textTheme.bodyMedium?.copyWith(color: Colors.blueGrey),
              ),
              Text(
                DateFormat('H:mm').format(message.createdAt),
                style: textTheme.bodySmall?.copyWith(color: Colors.blueGrey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

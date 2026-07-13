import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:flutter/material.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  final List<MessageEntity> messages;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemCount: messages.length,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      shrinkWrap: true,
      reverse: true,
      itemBuilder: (context, index) {
        final message = messages[index];
        return ListItem(key: ValueKey(message.id), message: message);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12.0),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.message});

  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        spacing: 8.0,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message.body ?? '',
            style: textTheme.bodySmall?.copyWith(color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}

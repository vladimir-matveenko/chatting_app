import 'package:chatting_app/app/constants/app_constants.dart';
import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:chatting_app/features/messages/presentation/cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/utils/extensions.dart';
import '../../../../core/presentation/widgets/app_dialog.dart';
import '../../../../core/presentation/widgets/reaction_menu.dart';

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
    final cubit = context.read<MessagesCubit>();

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

        final current = message.createdAt.toLocal();

        final nextIndex = index + 1;
        final hasNext = nextIndex < messages.length;
        final next = hasNext ? messages[nextIndex].createdAt.toLocal() : null;

        final shouldShowDate = next == null || !current.isSameDay(next);
        final messageKey = GlobalKey();

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
              messageKey: messageKey,
              message: message,
              currentUserId: currentUserId,
              messageColor: messageColor,
              onDeleteTap: () async {
                final result = await AppDialog.show(
                  context,
                  title: 'chatScreen.deleteMessage'.tr(),
                  text: 'chatScreen.areYouSure'.tr(),
                  cancelText: 'cancelText'.tr(),
                  okText: 'okText'.tr(),
                );
                if (result) {
                  cubit.deleteMessage(message.id);
                }
              },
              onReactionTap: () {
                showReactionsMenu(
                  context: context,
                  messageKey: messageKey,
                  reactions: AppConstants.reactions,
                  onReactionSelected: (reaction) {
                    cubit.addReaction(
                      message.id,
                      type: AppUtils.getReactionTypeBySymbol(reaction),
                    );
                  },
                );
              },
              onDeleteReactionTap: () {
                cubit.deleteReaction(message.id);
              },
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
    required this.messageKey,
    required this.message,
    required this.currentUserId,
    required this.messageColor,
    required this.onDeleteTap,
    required this.onReactionTap,
    required this.onDeleteReactionTap,
  });

  final GlobalKey messageKey;
  final MessageEntity message;
  final String currentUserId;
  final Color messageColor;
  final VoidCallback onDeleteTap;
  final VoidCallback onReactionTap;
  final VoidCallback onDeleteReactionTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final itsMe = currentUserId == message.senderId;

    return GestureDetector(
      key: messageKey,
      onTap: itsMe ? onReactionTap : null,
      onLongPress: itsMe ? onDeleteTap : null,
      child: Row(
        spacing: 8.0,
        mainAxisAlignment: itsMe ? .end : .start,
        children: [
          Column(
            spacing: 4.0,
            children: [
              Container(
                padding: const .all(8.0),
                decoration: BoxDecoration(
                  border: itsMe ? null : .all(color: messageColor),
                  borderRadius: .circular(12.0),
                  color: itsMe ? messageColor : null,
                ),
                child: Column(
                  spacing: 8.0,
                  crossAxisAlignment: .start,
                  children: [
                    if (message.isDeleted)
                      const Icon(Icons.close, size: 16.0, color: Colors.red)
                    else
                      Text(
                        message.body ?? '',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.blueGrey,
                        ),
                      ),
                    Text(
                      DateFormat('H:mm').format(message.createdAt),
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
              if (message.currentUserReaction != null)
                GestureDetector(
                  onTap: onDeleteReactionTap,
                  child: Text(
                    AppUtils.getReactionSymbol(message.currentUserReaction!),
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

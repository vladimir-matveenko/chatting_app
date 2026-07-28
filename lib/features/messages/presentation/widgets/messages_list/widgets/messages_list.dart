import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/features/chat/domain/entity/chat_entity.dart';
import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:chatting_app/features/messages/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/messages/presentation/widgets/messages_list/controllers/chat_scroll_controller.dart';
import 'package:chatting_app/features/messages/presentation/widgets/messages_list/widgets/chat_scroll_wrapper.dart';
import 'package:chatting_app/features/messages/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../../app/constants/app_constants.dart';
import '../../../../../../app/constants/app_enums.dart';
import '../../../../../../app/di/injection.dart';
import '../../../../../../app/utils/extensions.dart';
import '../../../../../../core/presentation/widgets/app_dialog.dart';
import '../../../../../../core/presentation/widgets/reaction_menu.dart';
import '../../../../../../core/presentation/widgets/slide_down_animated_widget.dart';
import '../../../../../chat/presentation/widgets/message_actions_menu.dart';
import '../../../../../profile/presentation/widgets/user_avatar.dart';
import '../../../../data/socket/messages_socket_service.dart';
import 'message_item/message_bubble.dart';
import 'message_item/message_item.dart';

class MessagesList extends StatefulWidget {
  const MessagesList({
    super.key,
    required this.messages,
    required this.scrollController,
    required this.currentUserId,
    required this.chat,
  });

  final List<MessageEntity> messages;
  final ChatScrollController scrollController;
  final String currentUserId;
  final ChatEntity chat;

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  final GlobalKey _listViewKey = GlobalKey();
  int? _lastMarkedMessageId;

  void _onVisibleItemsChanged() {
    final maxReadId = MessagesUtils.getMaxVisibleUnreadMessageId(
      scrollController: widget.scrollController,
      chat: widget.chat,
      messages: widget.messages,
      currentUserId: widget.currentUserId,
    );

    if (maxReadId != null && maxReadId != _lastMarkedMessageId) {
      _lastMarkedMessageId = maxReadId;
      _onMessageSeen(maxReadId);
    }
  }

  void _onMessageSeen(int maxReadId) {
    getIt<MessagesSocketService>().markRead(
      chatId: widget.chat.id,
      messageId: maxReadId.toString(),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.scrollController.itemPositionsListener.itemPositions.addListener(
      _onVisibleItemsChanged,
    );
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        if (widget.chat.lastReadMessageId != widget.messages.first.id) {
          final id = widget.messages.first.id;
          _onMessageSeen(id);
        }
      }
    });
  }

  @override
  void dispose() {
    widget.scrollController.itemPositionsListener.itemPositions.removeListener(
      _onVisibleItemsChanged,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final messageColor = isDark ? Colors.grey.shade200 : theme.cardTheme.color;
    final dateFormatter = DateFormat('yyyy.MM.dd', context.locale.languageCode);
    final timeFormatter = DateFormat('H:mm', context.locale.languageCode);
    final cubit = context.read<MessagesCubit>();
    final state = context.watch<MessagesCubit>().state;
    final isPinnedMessageSelected = state.pinnedMessages.any(
      (e) => e.id == state.selectedMessage?.id,
    );

    return Stack(
      children: [
        ChatScrollWrapper(
          controller: widget.scrollController,
          child: ScrollablePositionedList.separated(
            key: _listViewKey,
            reverse: true,
            itemCount: widget.messages.length,
            itemScrollController: widget.scrollController.itemScrollController,
            itemPositionsListener:
                widget.scrollController.itemPositionsListener,
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final message = widget.messages[index];

              final nextIndex = index + 1;
              final hasNext = nextIndex < widget.messages.length;
              final next = hasNext ? widget.messages[nextIndex] : null;

              final shouldShowDate =
                  next == null || !message.createdAt.isSameDay(next.createdAt);

              final bubbleKey = GlobalKey();

              final isIncomingMessage =
                  message.sender.id == widget.currentUserId;
              final showReadIndicator =
                  !isIncomingMessage &&
                      message.id <= (widget.chat.lastReadMessageId ?? -1) ||
                  isIncomingMessage && message.readCount > 0;

              final isCurrentUnRead =
                  message.id > (widget.chat.lastReadMessageId ?? -1);

              final isNextRead = hasNext
                  ? next!.id < (widget.chat.lastReadMessageId ?? -1)
                  : true;

              final isNextMine = hasNext
                  ? next!.sender.id == widget.currentUserId
                  : true;

              final isCurrentMine = message.sender.id == widget.currentUserId;

              final isSelected =
                  state.showMenu && state.selectedMessage?.id == message.id;

              final wasMessageChanged = message.createdAt != message.updatedAt;

              return Column(
                children: [
                  if (isCurrentUnRead &&
                      (isNextRead || isNextMine) &&
                      !isCurrentMine)
                    Chip(label: Text('chatScreen.unreadMessages'.tr())),
                  if (shouldShowDate)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0, top: 12.0),
                      child: Align(
                        alignment: .center,
                        child: Text(dateFormatter.format(message.createdAt)),
                      ),
                    ),
                  MessageItem(
                    key: ValueKey(message.id),
                    isSelected: isSelected,
                    avatar: (widget.chat.type == ChatType.group)
                        ? UserAvatar(
                            avatar: message.sender.avatarUrl ?? '',
                            firstName:
                                message.sender.displayName ??
                                message.sender.userName,
                          )
                        : null,
                    bubble: MessageBubble(
                      bubbleKey: bubbleKey,
                      text: message.body,
                      updatedAt: message.updatedAt,
                      timeFormatter: timeFormatter,
                      bubbleColor: isCurrentMine ? messageColor! : null,
                      border: isCurrentMine
                          ? null
                          : .all(color: messageColor!, width: 2.0),
                      showSender: widget.chat.type == ChatType.group,
                      sender: message.sender,
                      isEdited: wasMessageChanged,
                      showReadIndicator: showReadIndicator,
                      onTap: () {
                        if (state.showMenu) {
                          cubit.unSelectMessage();
                        } else {
                          showReactionsMenu(
                            context: context,
                            messageKey: bubbleKey,
                            reactions: AppConstants.reactions,
                            onReactionSelected: (reaction) {
                              cubit.addReaction(
                                chatId: widget.chat.id,
                                messageId: message.id.toString(),
                                type: AppUtils.getReactionTypeBySymbol(
                                  reaction,
                                ),
                              );
                            },
                          );
                        }
                      },
                      onLongPress: isCurrentMine
                          ? () {
                              cubit.selectMessage(message);
                            }
                          : null,
                    ),
                    reaction: message.currentUserReaction != null
                        ? GestureDetector(
                            onTap: () {
                              cubit.deleteReaction(
                                chatId: widget.chat.id,
                                messageId: message.id.toString(),
                              );
                            },
                            child: Text(
                              AppUtils.getReactionSymbol(
                                message.currentUserReaction!,
                              ),
                              style: const TextStyle(fontSize: 18.0),
                            ),
                          )
                        : null,
                    onTap: isSelected ? cubit.unSelectMessage : null,
                    bubbleAlignment: isCurrentMine ? .end : .start,
                  ),
                ],
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 16.0,
          child: SlideDownAnimatedWidget(
            child: state.showMenu
                ? MessageActionsMenu(
                    pinIcon: isPinnedMessageSelected
                        ? Icons.push_pin_outlined
                        : Icons.push_pin_rounded,
                    onPin: () {
                      cubit.unSelectMessage();
                      isPinnedMessageSelected
                          ? cubit.unpinMessage(
                              state.selectedMessage?.id.toString() ?? '',
                            )
                          : cubit.pinMessage(
                              state.selectedMessage?.id.toString() ?? '',
                            );
                    },
                    onEdit: cubit.activateEditingMode,
                    onDelete: () async {
                      final result = await AppDialog.show(
                        context,
                        title: 'chatScreen.deleteMessage'.tr(),
                        text: 'chatScreen.areYouSure'.tr(),
                        cancelText: 'cancelText'.tr(),
                        okText: 'okText'.tr(),
                      );
                      if (result) {
                        cubit.deleteMessage(
                          chatId: widget.chat.id,
                          messageId: state.selectedMessage?.id.toString() ?? '',
                        );
                      }
                    },
                  )
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}

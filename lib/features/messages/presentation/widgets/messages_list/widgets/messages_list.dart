import 'dart:async';

import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/core/presentation/widgets/app_loader.dart';
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
  late MessagesCubit cubit;
  Timer? _timer;
  int? _lastMarkedMessageId;
  bool _hasPrevious = false;
  bool _hasNext = false;
  bool _loadingTriggered = false;

  void _onPositionsChanged() {
    _onVisibleItemsChanged();
  }

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
    cubit = context.read<MessagesCubit>();
    widget.scrollController.itemPositionsListener.itemPositions.addListener(
      _onPositionsChanged,
    );
    _timer = Timer(const Duration(seconds: 5), () {
      if (mounted &&
          widget.messages.isNotEmpty &&
          (widget.chat.lastReadMessageId ?? 0) < widget.messages.first.id) {
        final id = widget.messages.first.id;
        _onMessageSeen(id);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.scrollController.itemPositionsListener.itemPositions.removeListener(
      _onPositionsChanged,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final messageColor = isDark ? Colors.grey.shade200 : theme.cardTheme.color;
    final dateFormatter = context.dateFormatter;
    final timeFormatter = context.timeFormatter;
    final state = context.watch<MessagesCubit>().state;
    final isPinnedMessageSelected = state.pinnedMessages.any(
      (e) => e.id == state.selectedMessage?.id,
    );
    _hasPrevious = state.messagesPageEntity?.hasPrevious ?? false;
    _hasNext = state.messagesPageEntity?.hasNext ?? false;

    return Stack(
      children: [
        ChatScrollWrapper(
          controller: widget.scrollController,
          onTap: state.status == MessagesListStatus.aroundContext
              ? () {
                  cubit.loadMessages(chatId: widget.chat.id);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    widget.scrollController.jumpToLatest();
                  });
                }
              : null,
          child: NotificationListener(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollUpdateNotification) {
                final metrics = notification.metrics;

                if (!_loadingTriggered &&
                    metrics.extentAfter < 100 &&
                    _hasPrevious &&
                    !cubit.state.showOlderLoader) {
                  cubit.loadOlderMessages(widget.chat.id);
                }

                if (!_loadingTriggered &&
                    metrics.extentBefore < 100 &&
                    _hasNext &&
                    !cubit.state.showNewerLoader) {
                  cubit.loadNewerMessages(widget.chat.id);
                }

                if (metrics.extentAfter > 200) {
                  _loadingTriggered = false;
                }
              }
              return false;
            },
            child: ScrollablePositionedList.separated(
              reverse: true,
              itemCount: widget.messages.length,
              itemScrollController:
                  widget.scrollController.itemScrollController,
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
                    next == null ||
                    !message.createdAt.isSameDay(next.createdAt);

                final bubbleKey = GlobalKey();

                final isIncomingMessage =
                    message.sender.id == widget.currentUserId;
                final showReadIndicator =
                    !isIncomingMessage &&
                        message.id <= (widget.chat.lastReadMessageId ?? -1) ||
                    isIncomingMessage && message.readCount > 0;

                final isCurrentUnRead =
                    message.id > (widget.chat.lastReadMessageId ?? -1);

                final hasPrevious = index > 0;
                final previous = hasPrevious
                    ? widget.messages[index - 1]
                    : null;
                final isPreviousRead = hasPrevious
                    ? previous!.readCount > 0
                    : true;

                final isPreviousMine = hasPrevious
                    ? previous!.sender.id == widget.currentUserId
                    : true;

                final isCurrentMine = message.sender.id == widget.currentUserId;

                final isSelected =
                    state.showMenu && state.selectedMessage?.id == message.id;

                final wasMessageChanged =
                    message.createdAt != message.updatedAt;

                return KeyedSubtree(
                  key: ValueKey(message.id),
                  child: Column(
                    children: [
                      if (isCurrentUnRead &&
                          !isCurrentMine &&
                          (isPreviousRead || isPreviousMine))
                        Chip(label: Text('chatScreen.unreadMessages'.tr())),
                      if (shouldShowDate)
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 12.0,
                            top: 12.0,
                          ),
                          child: Align(
                            alignment: .center,
                            child: Text(
                              dateFormatter.format(message.createdAt),
                            ),
                          ),
                        ),
                      MessageItem(
                        isSelected: isSelected,
                        isMessageMine: isCurrentMine,
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
                          reply: message.reply,
                          isEdited: wasMessageChanged,
                          showReadIndicator: showReadIndicator,
                          isHighlighted:
                              state.highlightedMessageId == message.id,
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
                          onLongPress: () {
                            cubit.selectMessage(message);
                          },
                          onReplyTap: () {
                            if (message.reply != null) {
                              final messageId = int.tryParse(message.reply!.id);
                              if (messageId != null) {
                                cubit.getAroundContext(
                                  chatId: message.chatId,
                                  messageId: messageId,
                                );
                              }
                            }
                          },
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
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 16.0,
          child: SlideDownAnimatedWidget(
            child: state.showMenu
                ? MessageActionsMenu(
                    isMessageMine:
                        state.selectedMessage?.sender.id ==
                        widget.currentUserId,
                    pinIcon: isPinnedMessageSelected
                        ? Icons.push_pin_outlined
                        : Icons.push_pin_rounded,
                    onPin: () {
                      cubit.unSelectMessage();
                      isPinnedMessageSelected
                          ? cubit.unpinMessage(state.selectedMessage?.id ?? -1)
                          : cubit.pinMessage(state.selectedMessage?.id ?? -1);
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
                    onReply: () {
                      if (state.selectedMessage != null) {
                        cubit.activateReplyMode();
                      }
                    },
                  )
                : const SizedBox(),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: state.showOlderLoader ? 0 : null,
          bottom: state.showNewerLoader ? 0 : null,
          child: state.showNewerLoader || state.showOlderLoader
              ? const AppLoader(size: 20.0)
              : const SizedBox(),
        ),
      ],
    );
  }
}

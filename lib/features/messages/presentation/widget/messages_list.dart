import 'package:chatting_app/app/constants/app_constants.dart';
import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/core/presentation/widgets/scroll_up_wrapper.dart';
import 'package:chatting_app/features/chat/domain/entity/chat_entity.dart';
import 'package:chatting_app/features/messages/data/socket/messages_socket_service.dart';
import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:chatting_app/features/messages/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/profile/presentation/widgets/user_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/theme/app_semantic_colors.dart';
import '../../../../app/utils/extensions.dart';
import '../../../../core/presentation/widgets/app_dialog.dart';
import '../../../../core/presentation/widgets/base_list_view.dart';
import '../../../../core/presentation/widgets/reaction_menu.dart';
import '../../../../core/presentation/widgets/slide_down_animated_widget.dart';
import '../../../chat/presentation/widgets/message_actions_menu.dart';

class MessagesList extends StatefulWidget {
  const MessagesList({
    super.key,
    required this.messages,
    required this.scrollController,
    required this.currentUserId,
    required this.chat,
  });

  final List<MessageEntity> messages;
  final ScrollController scrollController;
  final String currentUserId;
  final ChatEntity chat;

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  final GlobalKey _listViewKey = GlobalKey();

  void _checkVisibleItems() {
    final BuildContext? listViewContext = _listViewKey.currentContext;
    if (listViewContext == null) return;

    final rootObject = listViewContext.findRenderObject();
    final renderObject = AppUtils.findSliverAdapter(rootObject);

    if (renderObject == null) return;

    RenderBox? child = renderObject.firstChild;
    if (child == null) return;

    int maxVisibleId = 0;

    while (child != null) {
      final parentData = child.parentData;

      if (parentData is SliverMultiBoxAdaptorParentData) {
        final index = parentData.index;

        if (index != null && index >= 0 && index < widget.messages.length) {
          final message = widget.messages[index];
          final id = int.tryParse(message.id) ?? 0;

          final isIncoming = message.sender.id != widget.currentUserId;

          final lastReadMessageId =
              int.tryParse(widget.chat.lastReadMessageId ?? '0') ?? 0;

          if (isIncoming && id < lastReadMessageId) {
            break;
          }

          if (isIncoming) {
            if (id > maxVisibleId) {
              maxVisibleId = id;
            }
          }
        }
      }

      child = renderObject.childAfter(child);
    }

    if (maxVisibleId > 0) {
      _onMessageSeen(maxVisibleId);
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
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        if (widget.chat.lastReadMessageId != widget.messages.first.id) {
          final id = int.tryParse(widget.messages.first.id) ?? 0;
          _onMessageSeen(id);
        }
      }
    });
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

    return Stack(
      children: [
        ScrollWrapper(
          controller: widget.scrollController,
          reverse: true,
          list: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification ||
                  scrollNotification is ScrollEndNotification) {
                _checkVisibleItems();
              }
              return false;
            },
            child: BaseListView<MessageEntity>(
              listViewKey: _listViewKey,
              items: widget.messages,
              reverse: true,
              controller: widget.scrollController,
              separator: const SizedBox(height: 8.0),
              itemBuilder: (context, index) {
                final message = widget.messages[index];

                final current = message.createdAt.toLocal();

                final nextIndex = index + 1;
                final hasNext = nextIndex < widget.messages.length;
                final next = hasNext
                    ? widget.messages[nextIndex].createdAt.toLocal()
                    : null;

                final shouldShowDate = next == null || !current.isSameDay(next);
                final messageKey = GlobalKey();

                final isIncomingMessage =
                    message.sender.id == widget.currentUserId;
                final markAsRead =
                    !isIncomingMessage &&
                        (int.tryParse(message.id) ?? 0) <=
                            (int.tryParse(
                                  widget.chat.lastReadMessageId ?? '0',
                                ) ??
                                0) ||
                    isIncomingMessage && message.readCount > 0;

                return Column(
                  children: [
                    if (shouldShowDate)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0, top: 12.0),
                        child: Align(
                          alignment: .center,
                          child: Text(dateFormatter.format(current)),
                        ),
                      ),
                    ListItem(
                      key: ValueKey(message.id),
                      isSelected:
                          state.showMenu &&
                          state.selectedMessage?.id == message.id,
                      chatType: widget.chat.type,
                      messageKey: messageKey,
                      message: message,
                      markAsRead: markAsRead,
                      timeFormatter: timeFormatter,
                      currentUserId: widget.currentUserId,
                      messageColor: messageColor!,
                      onSelectMessageTap: () async {
                        cubit.selectMessage(message);
                      },
                      onUnselectMessageTap: cubit.unSelectMessage,
                      onReactionTap: () {
                        if (state.showMenu) {
                          cubit.unSelectMessage();
                        } else {
                          showReactionsMenu(
                            context: context,
                            messageKey: messageKey,
                            reactions: AppConstants.reactions,
                            onReactionSelected: (reaction) {
                              cubit.addReaction(
                                chatId: widget.chat.id,
                                messageId: message.id,
                                type: AppUtils.getReactionTypeBySymbol(
                                  reaction,
                                ),
                              );
                            },
                          );
                        }
                      },
                      onDeleteReactionTap: () {
                        cubit.deleteReaction(
                          chatId: widget.chat.id,
                          messageId: message.id,
                        );
                      },
                    ),
                  ],
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
                          messageId: state.selectedMessage?.id ?? '',
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

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.messageKey,
    required this.message,
    required this.currentUserId,
    required this.messageColor,
    required this.onSelectMessageTap,
    required this.onUnselectMessageTap,
    required this.onReactionTap,
    required this.onDeleteReactionTap,
    this.isSelected = false,
    required this.timeFormatter,
    required this.chatType,
    this.markAsRead = false,
  });

  final GlobalKey messageKey;
  final MessageEntity message;
  final String currentUserId;
  final Color messageColor;
  final VoidCallback onSelectMessageTap;
  final VoidCallback onUnselectMessageTap;
  final VoidCallback onReactionTap;
  final VoidCallback onDeleteReactionTap;
  final bool isSelected;
  final DateFormat timeFormatter;
  final ChatType chatType;
  final bool markAsRead;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final itsMe = currentUserId == message.sender.id;
    final colors = theme.extension<AppSemanticColors>()!;
    final wasMessageChanged = message.createdAt != message.updatedAt;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.lightBlueAccent.withValues(alpha: 0.2)
                : null,
            borderRadius: BorderRadius.circular(12.0),
          ),

          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: isSelected ? onUnselectMessageTap : null,
            child: Row(
              spacing: 8.0,
              mainAxisAlignment: itsMe ? .end : .start,
              children: [
                Column(
                  spacing: 4.0,
                  children: [
                    Row(
                      mainAxisSize: .min,
                      spacing: 8.0,
                      children: [
                        if (chatType == ChatType.group)
                          UserAvatar(
                            avatar: message.sender.avatarUrl ?? '',
                            firstName:
                                message.sender.displayName ??
                                message.sender.userName,
                          ),
                        GestureDetector(
                          key: messageKey,
                          onTap: onReactionTap,
                          onLongPress: itsMe ? onSelectMessageTap : null,
                          child: Container(
                            padding: const .all(8.0),
                            decoration: BoxDecoration(
                              border: itsMe
                                  ? null
                                  : .all(color: messageColor, width: 2.0),
                              borderRadius: .circular(12.0),
                              color: itsMe ? messageColor : null,
                            ),
                            child: Column(
                              spacing: 8.0,
                              crossAxisAlignment: .start,
                              children: [
                                if (chatType == ChatType.group)
                                  Text(
                                    message.sender.displayName ??
                                        message.sender.userName,
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                if (message.isDeleted)
                                  Icon(
                                    Icons.close,
                                    size: 16.0,
                                    color: theme.colorScheme.error,
                                  )
                                else
                                  Text(
                                    message.body ?? '',
                                    style: textTheme.bodyMedium,
                                  ),
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  spacing: 8.0,
                                  children: [
                                    if (wasMessageChanged)
                                      Text(
                                        'chatScreen.edited'.tr(),
                                        style: textTheme.bodySmall?.copyWith(
                                          fontSize: 10,
                                        ),
                                      ),
                                    Text(
                                      timeFormatter.format(
                                        message.updatedAt.toLocal(),
                                      ),
                                      style: textTheme.bodySmall,
                                    ),
                                    if (markAsRead)
                                      Icon(
                                        Icons.done_all,
                                        size: 12.0,
                                        color: colors.success,
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (message.currentUserReaction != null)
                      GestureDetector(
                        onTap: onDeleteReactionTap,
                        child: Text(
                          AppUtils.getReactionSymbol(
                            message.currentUserReaction!,
                          ),
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (isSelected)
          Positioned(
            left: 16.0,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.check_circle_outline_outlined,
              color: colors.success,
            ),
          ),
      ],
    );
  }
}

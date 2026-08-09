import 'package:chatting_app/core/presentation/widgets/app_dialog.dart';
import 'package:chatting_app/core/presentation/widgets/app_loader.dart';
import 'package:chatting_app/features/chat/domain/entity/chat_entity.dart';
import 'package:chatting_app/features/chat/presentation/widgets/chat_participants_bar.dart';
import 'package:chatting_app/features/chat/presentation/widgets/pinned_message_widget.dart';
import 'package:chatting_app/features/chat/presentation/widgets/pinned_messages_modal.dart';
import 'package:chatting_app/features/chat/presentation/widgets/search_message_modal.dart';
import 'package:chatting_app/features/messages/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/messages/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../messages/presentation/widgets/message_bar.dart';
import '../../../messages/presentation/widgets/messages_list/controllers/chat_scroll_controller.dart';
import '../../../messages/presentation/widgets/messages_list/widgets/messages_list.dart';

class ChatScreenBody extends StatefulWidget {
  const ChatScreenBody({
    super.key,
    required this.chat,
    required this.scrollController,
    required this.messageController,
    required this.currentUserId,
    required this.messageFocusNode,
  });

  final ChatEntity chat;
  final ChatScrollController scrollController;
  final TextEditingController messageController;
  final String currentUserId;
  final FocusNode messageFocusNode;

  @override
  State<ChatScreenBody> createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  void _sendMessage(
    BuildContext context, {
    String? messageId,
    String? replyToId,
  }) {
    if (widget.messageController.text.trim().isEmpty) return;
    final cubit = context.read<MessagesCubit>();

    if (messageId != null) {
      cubit.updateMessage(
        chatId: widget.chat.id,
        messageId: messageId,
        body: widget.messageController.text,
      );
      widget.messageController.clear();
    } else {
      cubit.sendMessage(
        chatId: widget.chat.id,
        type: MessageType.text,
        body: widget.messageController.text,
        replyToId: replyToId,
      );
      widget.messageController.clear();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.scrollController.itemScrollController.isAttached) {
          widget.scrollController.animateToLatest();
        }
      });
    }
    if (replyToId != null) {
      FocusScope.of(context).unfocus();
      cubit.disableReplyMode();
      widget.messageController.clear();
    }
  }

  void _handleScroll(BuildContext context, MessagesState state) {
    if (state.isLoading || !state.shouldScroll) {
      return;
    }
    final targetIndex = state.highlightedMessageIndex;
    final messages = state.messagesPageEntity?.messages;

    if (targetIndex == null ||
        targetIndex < 0 ||
        messages == null ||
        targetIndex >= messages.length) {
      return;
    }

    final targetMessage = messages[targetIndex];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentMessages = context
          .read<MessagesCubit>()
          .state
          .messagesPageEntity
          ?.messages;

      if (currentMessages != null &&
          targetIndex < currentMessages.length &&
          targetIndex >= 0) {
        widget.scrollController.centerOnIndex(targetIndex);
        context.read<MessagesCubit>().highlightMessage(targetMessage.id);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _handleScroll(context, context.read<MessagesCubit>().state);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MessagesCubit>();
    return BlocConsumer<MessagesCubit, MessagesState>(
      builder: (context, state) {
        final isLoading = state.isLoading;
        return Stack(
          alignment: .center,
          children: [
            Column(
              children: [
                ChatParticipantsBar(
                  key: ValueKey(widget.chat.id),
                  trailing: IconButton(
                    onPressed: () {
                      AppDialog.empty(
                        context,
                        content: SearchMessageModal(chatId: widget.chat.id),
                        onClose: () {
                          cubit.disableCloseModal();
                          cubit.disableSearch();
                        },
                      );
                    },
                    icon: const Icon(Icons.search),
                  ),
                ),
                if (state.pinnedMessages.isNotEmpty)
                  PinnedMessageWidget(
                    messages: state.pinnedMessages,
                    onUnpinTap: (id) {
                      cubit.unpinMessage(id);
                    },
                    onNavigateTap: (message) {
                      cubit.getAroundContext(
                        chatId: message.chatId,
                        messageId: message.id,
                      );
                    },
                    onShowModalTap: () {
                      AppDialog.empty(
                        context,
                        content: const PinnedMessagesModal(),
                        onClose: cubit.disableCloseModal,
                      );
                    },
                  ),
                Expanded(
                  child: Padding(
                    padding: const .symmetric(horizontal: 16.0),
                    child: MessagesList(
                      chat: widget.chat,
                      scrollController: widget.scrollController,
                      messages: state.messagesPageEntity?.messages ?? [],
                      currentUserId: widget.currentUserId,
                    ),
                  ),
                ),
                Padding(
                  padding: const .symmetric(horizontal: 16.0),
                  child: MessageBar(
                    messageFocusNode: widget.messageFocusNode,
                    onSend: () {
                      if (state.editModeActive) {
                        _sendMessage(
                          context,
                          messageId: state.selectedMessage?.id.toString(),
                        );
                        cubit.unSelectMessage();
                        widget.messageController.clear();
                      } else {
                        final replyToId = state.replyModeActive
                            ? state.selectedMessage?.id.toString()
                            : null;
                        _sendMessage(context, replyToId: replyToId);
                      }
                    },
                    onCancel: () {
                      cubit.unSelectMessage();
                      widget.messageController.clear();
                    },
                    messageController: widget.messageController,
                  ),
                ),
              ],
            ),
            if (isLoading) const Center(child: AppLoader()),
          ],
        );
      },
      listener: _handleScroll,
    );
  }
}

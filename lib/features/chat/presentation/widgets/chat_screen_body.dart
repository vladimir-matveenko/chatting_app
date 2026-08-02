import 'package:chatting_app/core/presentation/widgets/app_dialog.dart';
import 'package:chatting_app/features/chat/domain/entity/chat_entity.dart';
import 'package:chatting_app/features/chat/presentation/widgets/chat_participants_bar.dart';
import 'package:chatting_app/features/chat/presentation/widgets/pinned_message_widget.dart';
import 'package:chatting_app/features/chat/presentation/widgets/pinned_messages_modal.dart';
import 'package:chatting_app/features/messages/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/messages/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/presentation/widgets/app_loader.dart';
import '../../../messages/presentation/widgets/message_bar.dart';
import '../../../messages/presentation/widgets/messages_list/controllers/chat_scroll_controller.dart';
import '../../../messages/presentation/widgets/messages_list/widgets/messages_list.dart';

class ChatScreenBody extends StatelessWidget {
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

  void _sendMessage(
    BuildContext context, {
    String? messageId,
    String? replyToId,
  }) {
    if (messageController.text.trim().isEmpty) return;
    final cubit = context.read<MessagesCubit>();

    if (messageId != null) {
      cubit.updateMessage(
        chatId: chat.id,
        messageId: messageId,
        body: messageController.text,
      );
      messageController.clear();
    } else {
      cubit.sendMessage(
        chatId: chat.id,
        type: MessageType.text,
        body: messageController.text,
        replyToId: replyToId,
      );
      messageController.clear();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.itemScrollController.isAttached) {
          scrollController.animateToLatest();
        }
      });
    }
    if (replyToId != null) {
      FocusScope.of(context).unfocus();
      cubit.disableReplyMode();
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MessagesCubit>();
    return BlocConsumer<MessagesCubit, MessagesState>(
      builder: (context, state) {
        final isLoading = state.isLoading;
        return isLoading
            ? const Center(child: AppLoader())
            : Column(
                children: [
                  ChatParticipantsBar(key: ValueKey(chat.id)),
                  if (state.pinnedMessages.isNotEmpty)
                    PinnedMessageWidget(
                      messages: state.pinnedMessages,
                      onUnpinTap: (id) {
                        cubit.unpinMessage(id);
                      },
                      onNavigateTap: (message) {
                        cubit.getAroundContext(
                          chatId: message.chatId,
                          message: message,
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
                      child:
                          (state.messagesPageEntity?.messages.isNotEmpty ==
                              true)
                          ? MessagesList(
                              key: ValueKey(state.status),
                              chat: chat,
                              scrollController: scrollController,
                              messages: state.messagesPageEntity!.messages,
                              currentUserId: currentUserId,
                            )
                          : const SizedBox(),
                    ),
                  ),
                  Padding(
                    padding: const .symmetric(horizontal: 16.0),
                    child: MessageBar(
                      messageFocusNode: messageFocusNode,
                      onSend: () {
                        if (state.editModeActive) {
                          _sendMessage(
                            context,
                            messageId: state.selectedMessage?.id.toString(),
                          );
                          cubit.unSelectMessage();
                          messageController.clear();
                        } else {
                          final replyToId = state.replyModeActive
                              ? state.selectedMessage?.id.toString()
                              : null;
                          _sendMessage(context, replyToId: replyToId);
                        }
                      },
                      onCancel: () {
                        cubit.unSelectMessage();
                        messageController.clear();
                      },
                      messageController: messageController,
                    ),
                  ),
                ],
              );
      },
      listenWhen: (prev, current) =>
          prev.shouldScroll != current.shouldScroll && current.shouldScroll,
      listener: (context, state) {
        if (state.selectedPinnedMessage != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final index = state.messagesPageEntity!.messages.indexOf(
              state.selectedPinnedMessage!,
            );
            scrollController.centerOnIndex(index);
            context.read<MessagesCubit>().highlightMessage(
              state.selectedPinnedMessage!.id,
            );
          });
        }
      },
    );
  }
}

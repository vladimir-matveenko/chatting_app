import 'package:chatting_app/core/presentation/widgets/app_dialog.dart';
import 'package:chatting_app/features/chat/domain/entity/chat_entity.dart';
import 'package:chatting_app/features/chat/presentation/widgets/chat_participants_bar.dart';
import 'package:chatting_app/features/chat/presentation/widgets/pinned_message_item.dart';
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
  });

  final ChatEntity chat;
  final ChatScrollController scrollController;
  final TextEditingController messageController;
  final String currentUserId;

  void _sendMessage(BuildContext context, {String? messageId}) {
    if (messageController.text.trim().isEmpty) return;

    if (messageId != null) {
      context.read<MessagesCubit>().updateMessage(
        chatId: chat.id,
        messageId: messageId,
        body: messageController.text,
      );
    } else {
      context.read<MessagesCubit>().sendMessage(
        chatId: chat.id,
        type: MessageType.text,
        body: messageController.text,
      );
      messageController.clear();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.itemScrollController.isAttached) {
          scrollController.animateToLatest();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MessagesCubit>();
    return BlocBuilder<MessagesCubit, MessagesState>(
      builder: (context, state) {
        final isLoading = state.isLoading;
        return isLoading
            ? const Center(child: AppLoader())
            : Column(
                children: [
                  ChatParticipantsBar(key: ValueKey(chat.id)),
                  if (state.pinnedMessages.isNotEmpty)
                    Padding(
                      padding: const .only(top: 16.0, left: 16.0, right: 16.0),
                      child: PinnedMessageItem(
                        onShowModalTap: () {
                          AppDialog.empty(
                            context,
                            content: const PinnedMessagesModal(),
                            onClose: cubit.disableCloseModal,
                          );
                        },
                        onUnpinTap: () {
                          cubit.unpinMessage(
                            state.pinnedMessages.first.id.toString(),
                          );
                        },
                        onNavigateTap: () {
                          cubit.getAroundContext(
                            chatId: state.pinnedMessages.first.chatId,
                            messageId: state.pinnedMessages.first.id.toString(),
                            after: 1,
                            before: 1,
                          );
                        },
                        itemsCount: state.pinnedMessages.length,
                        message: state.pinnedMessages.last,
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: const .symmetric(horizontal: 16.0),
                      child: MessagesList(
                        chat: chat,
                        scrollController: scrollController,
                        messages: state.messages,
                        currentUserId: currentUserId,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const .symmetric(horizontal: 16.0),
                    child: MessageBar(
                      onSend: () {
                        if (state.editModeActive) {
                          _sendMessage(
                            context,
                            messageId: state.selectedMessage?.id.toString(),
                          );
                          cubit.unSelectMessage();
                          messageController.clear();
                        } else {
                          _sendMessage(context);
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
    );
  }
}

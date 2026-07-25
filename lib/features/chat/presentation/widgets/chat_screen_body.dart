import 'package:chatting_app/features/chat/domain/entity/chat_entity.dart';
import 'package:chatting_app/features/chat/presentation/widgets/chat_participants_bar.dart';
import 'package:chatting_app/features/chat/presentation/widgets/pinned_messages_block.dart';
import 'package:chatting_app/features/messages/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/messages/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/presentation/widgets/app_loader.dart';
import '../../../messages/presentation/widget/message_bar.dart';
import '../../../messages/presentation/widget/messages_list.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({
    super.key,
    required this.chat,
    required this.scrollController,
    required this.messageController,
    required this.currentUserId,
  });

  final ChatEntity chat;
  final ScrollController scrollController;
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
        if (scrollController.hasClients) {
          scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
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
                      child: PinnedMessagesBlock(
                        pinnedMessages: state.pinnedMessages,
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
                            messageId: state.selectedMessage?.id,
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

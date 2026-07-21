import 'package:chatting_app/features/chat/presentation/widgets/chat_participants_bar.dart';
import 'package:chatting_app/features/chat/presentation/widgets/pinned_messages_block.dart';
import 'package:chatting_app/features/messages/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/messages/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../app/di/injection.dart';
import '../../../../core/presentation/widgets/app_loader.dart';
import '../../../../core/presentation/widgets/app_message.dart';
import '../../../messages/presentation/widget/message_bar.dart';
import '../../../messages/presentation/widget/messages_list.dart';
import '../../../profile/domain/repository/profile_repository.dart';

class ChatScreenBody extends StatefulWidget {
  const ChatScreenBody({super.key, required this.chatId});

  final String chatId;

  @override
  State<ChatScreenBody> createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  final _userProfile = getIt<ProfileRepository>().profile;
  late String currentUserId;
  late MessagesCubit cubit;
  final _scrollController = ScrollController();
  final _messageController = TextEditingController();

  void _sendMessage(BuildContext context, {String? messageId}) {
    if (_messageController.text.trim().isEmpty) return;

    if (messageId != null) {
      cubit.updateMessage(messageId: messageId, body: _messageController.text);
    } else {
      context.read<MessagesCubit>().sendMessage(
        chatId: widget.chatId,
        type: MessageType.text,
        body: _messageController.text,
      );
      _messageController.clear();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<MessagesCubit>();
    currentUserId = _userProfile?.id ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessagesCubit, MessagesState>(
      builder: (context, state) {
        final isLoading = state.isLoading;
        return isLoading
            ? const Center(child: AppLoader())
            : Column(
                children: [
                  const ChatParticipantsBar(),
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
                        scrollController: _scrollController,
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
                          _messageController.clear();
                        } else {
                          _sendMessage(context);
                        }
                      },
                      onCancel: () {
                        cubit.unSelectMessage();
                        _messageController.clear();
                      },
                      messageController: _messageController,
                    ),
                  ),
                ],
              );
      },
      listener: (context, state) {
        if (state.updateList) {
          cubit.loadMessages(chatId: widget.chatId);
        }
        if (state.error?.isNotEmpty == true) {
          AppMessage.error(
            context,
            message: state.error!,
            onClose: () {
              cubit.disableError();
            },
          );
        }
        if (state.editModeActive) {
          _messageController.text = state.selectedMessage?.body ?? '';
        }
      },
    );
  }
}

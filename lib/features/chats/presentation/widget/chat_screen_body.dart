import 'package:chatting_app/features/messages/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/messages/presentation/cubit/state.dart';
import 'package:chatting_app/features/profile/presentation/profile_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/presentation/widgets/app_loader.dart';
import '../../../../core/presentation/widgets/app_message.dart';
import '../../../messages/presentation/widget/message_bar.dart';
import '../../../messages/presentation/widget/messages_list.dart';
import '../../domain/entity/chat_list_item_entity.dart';

class ChatScreenBody extends StatefulWidget {
  const ChatScreenBody({super.key, required this.chatId});

  final String chatId;

  @override
  State<ChatScreenBody> createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  late String currentUserId;
  final _scrollController = ScrollController();
  final _messageController = TextEditingController();

  void _sendMessage(BuildContext context) {
    context.read<MessagesCubit>().sendMessage(
      chatId: widget.chatId,
      type: MessageType.text,
      body: _messageController.text,
    );
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

  @override
  void initState() {
    super.initState();
    currentUserId = context.read<ProfileCubit>().state.profile?.id ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessagesCubit, MessagesState>(
      builder: (context, state) {
        final isLoading = state.isLoading;
        return isLoading
            ? const Center(child: AppLoader())
            : Column(
                mainAxisSize: .max,
                children: [
                  Expanded(
                    child: MessagesList(
                      scrollController: _scrollController,
                      messages: state.messages,
                      currentUserId: currentUserId,
                    ),
                  ),
                  MessageBar(
                    onSend: () {
                      _sendMessage(context);
                      _messageController.text = '';
                    },
                    messageController: _messageController,
                  ),
                ],
              );
      },
      listener: (context, state) {
        if (state.updateList) {
          context.read<MessagesCubit>().loadMessages(chatId: widget.chatId);
        }
        if (state.error?.isNotEmpty == true) {
          AppMessage.error(
            context,
            message: state.error!,
            onClose: () {
              context.read<MessagesCubit>().disableError();
            },
          );
        }
      },
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.onTap, required this.chat});

  final ChatListItemEntity chat;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          spacing: 8.0,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              chat.id,
              style: textTheme.bodySmall?.copyWith(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}

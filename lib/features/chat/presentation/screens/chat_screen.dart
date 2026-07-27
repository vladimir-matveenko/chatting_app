import 'package:chatting_app/core/presentation/widgets/app_loader.dart';
import 'package:chatting_app/core/presentation/widgets/something_went_wrong_widget.dart';
import 'package:chatting_app/features/chat/presentation/cubit/state.dart';
import 'package:chatting_app/features/messages/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/presentation/widgets/app_message.dart';
import '../../../messages/presentation/cubit/state.dart';
import '../../../profile/domain/repository/profile_repository.dart';
import '../../data/socket/chat_socket_service.dart';
import '../cubit/cubit.dart';
import '../widgets/chat_screen_body.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.id});

  final String id;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _userProfile = getIt<ProfileRepository>().profile;
  late ChatCubit chatCubit;
  late MessagesCubit messagesCubit;
  final _scrollController = ScrollController();
  final _messageController = TextEditingController();

  @override
  void initState() {
    chatCubit = context.read<ChatCubit>();
    messagesCubit = context.read<MessagesCubit>();
    chatCubit.disableNavigate();
    chatCubit.getChatMembers(chatId: widget.id);
    messagesCubit.loadMessages(chatId: widget.id);
    messagesCubit.getPinnedMessages(chatId: widget.id);
    getIt<ChatSocketService>().joinChat(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    getIt<ChatSocketService>().leaveChat(widget.id);
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ChatCubit, ChatState>(
          listenWhen: (previous, current) => previous.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty == true) {
              AppMessage.error(
                context,
                message: state.error!,
                onClose: () {
                  chatCubit.disableError();
                },
              );
            }
          },
        ),

        BlocListener<MessagesCubit, MessagesState>(
          listenWhen: (previous, current) =>
              previous.error != current.error ||
              previous.editModeActive != current.editModeActive,
          listener: (context, state) {
            if (state.error?.isNotEmpty == true) {
              AppMessage.error(
                context,
                message: state.error!,
                onClose: () {
                  messagesCubit.disableError();
                },
              );
            }
            if (state.editModeActive) {
              _messageController.text = state.selectedMessage?.body ?? '';
            }
          },
        ),
      ],
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: AppLoader());
          }
          return state.chat != null
              ? ChatScreenBody(
                  chat: state.chat!,
                  scrollController: _scrollController,
                  messageController: _messageController,
                  currentUserId: _userProfile?.id ?? '',
                )
              : const SomethingWentWrongWidget();
        },
      ),
    );
  }
}

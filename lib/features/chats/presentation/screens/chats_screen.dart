import 'package:chatting_app/core/presentation/widgets/app_loader.dart';
import 'package:chatting_app/features/chats/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/chats/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/app_message.dart';
import '../widgets/chat_list.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatsCubit>();
    return BlocConsumer<ChatsCubit, ChatsState>(
      builder: (context, state) {
        final isLoading = state.isLoading;
        return isLoading
            ? const Center(child: AppLoader())
            : ChatList(chats: state.chats);
      },
      listenWhen: (previous, current) => previous.error != current.error,
      listener: (context, state) {
        if (state.error?.isNotEmpty == true) {
          AppMessage.error(
            context,
            message: state.error!,
            onClose: cubit.disableError,
          );
        }
      },
    );
  }
}

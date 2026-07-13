import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/core/presentation/widgets/app_loader.dart';
import 'package:chatting_app/features/chats/presentation/chats_cubit/cubit.dart';
import 'package:chatting_app/features/chats/presentation/chats_cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/chat_list.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        final isLoading = state.isLoading;
        return isLoading
            ? const Center(child: AppLoader())
            : Column(
                spacing: 16.0,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<ChatsCubit>().loadChats();
                        },
                        child: const Icon(Icons.refresh),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ChatsCubit>().createChat(
                            type: ChatType.private,
                            memberIds: ['1', '3'],
                          );
                        },
                        child: const Icon(Icons.chat_bubble),
                      ),
                    ],
                  ),
                  ChatList(chats: state.chats),
                ],
              );
      },
    );
  }
}

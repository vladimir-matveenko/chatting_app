import 'package:chatting_app/core/presentation/widgets/app_loader.dart';
import 'package:chatting_app/features/chats/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/chats/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<ChatsCubit>();
                    },
                    child: const Icon(Icons.refresh),
                  ),
                ],
              );
      },
    );
  }
}

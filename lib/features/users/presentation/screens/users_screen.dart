import 'package:chatting_app/core/presentation/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../chat/presentation/cubit/cubit.dart';
import '../../../chat/presentation/cubit/state.dart';
import '../users_cubit/cubit.dart';
import '../users_cubit/state.dart';
import '../widgets/users_list.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatCubit, ChatState>(
      listenWhen: (previous, current) =>
          previous.shouldNavigate != current.shouldNavigate &&
          current.shouldNavigate,
      listener: (context, state) {
        if (state.shouldNavigate) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('${AppRoutes.chats}/${state.chat?.id}');
          });
        }
      },
      child: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          final isLoading = state.isLoading;
          return isLoading
              ? const Center(child: AppLoader())
              : UsersList(users: state.users);
        },
      ),
    );
  }
}

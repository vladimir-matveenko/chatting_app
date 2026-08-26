import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/core/presentation/widgets/app_loader.dart';
import 'package:chatting_app/features/chats/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/presentation/widgets/app_search_bar.dart';
import '../../../chat/presentation/cubit/cubit.dart';
import '../../../chat/presentation/cubit/state.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../widgets/users_list.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late UsersCubit cubit;
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  void _onScroll() {
    if (AppUtils.isBottomOfList(_scrollController)) {
      cubit.loadMoreUsers(query: _searchController.text);
    }
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<UsersCubit>();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatCubit, ChatState>(
      listenWhen: (previous, current) =>
          previous.shouldNavigate != current.shouldNavigate &&
          current.shouldNavigate,
      listener: (context, state) {
        if (state.shouldNavigate) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<ChatsCubit>().loadAllChats();
            context.go('${AppRoutes.chats}/${state.chat?.id}');
          });
        }
      },
      child: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          final isLoading = state.isLoading;
          return isLoading
              ? const Center(child: AppLoader())
              : Padding(
                  padding: const .symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: .min,
                    crossAxisAlignment: .stretch,
                    children: [
                      Padding(
                        padding: const .symmetric(vertical: 16.0),
                        child: AppSearchBar(
                          onChanged: (query) {
                            cubit.loadUsers(query: query);
                          },
                        ),
                      ),
                      Flexible(
                        child: UsersList(
                          users: state.users,
                          scrollController: _scrollController,
                        ),
                      ),
                      if (state.showLoader) const AppLoader(size: 20.0),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

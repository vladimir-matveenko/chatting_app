import 'package:chatting_app/features/chats/presentation/chats_cubit/cubit.dart';
import 'package:chatting_app/features/main/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/widgets/app_back_button.dart';
import '../utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    required this.navigationShell,
    required this.state,
  });

  final StatefulNavigationShell navigationShell;
  final GoRouterState state;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ChatsCubit chatsCubit;

  @override
  void initState() {
    chatsCubit = context.read<ChatsCubit>();
    chatsCubit.loadChats(loadSilent: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(MainScreenUtils.getAppBarTitle(context)),
        centerTitle: true,
        leading: MainScreenUtils.showBackButton(context)
            ? const AppBackButton()
            : null,
      ),
      body: SafeArea(
        left: true,
        right: true,
        minimum: const .only(left: 16.0, right: 16.0),
        child: widget.navigationShell,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: widget.navigationShell.currentIndex,
        onItemTap: (index) {
          widget.navigationShell.goBranch(index);
        },
      ),
    );
  }
}

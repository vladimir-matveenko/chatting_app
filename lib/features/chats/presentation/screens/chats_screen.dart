import 'package:chatting_app/features/chats/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/chats/presentation/cubit/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/presentation/widgets/app_message.dart';
import '../../../../core/presentation/widgets/app_search_bar.dart';
import '../../../../core/presentation/widgets/custom_tab_bar.dart';
import '../widgets/chat_list.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen>
    with TickerProviderStateMixin {
  final _scrollController = ScrollController();
  final _archiveScrollController = ScrollController();
  late TabController _tabController;
  late ChatsCubit cubit;
  int? initialIndex;
  int _currentIndex = 0;
  final int tabCount = 2;
  String query = '';

  /// Initialized tabs
  final Map<int, Widget> _builtTabs = {};

  Widget _buildTab(int index) {
    /// return if already exist
    if (_builtTabs.containsKey(index)) {
      return _builtTabs[index]!;
    }

    late final Widget tab;
    switch (index) {
      case 0:
        tab = ChatList(scrollController: _scrollController);
        break;
      case 1:
        tab = ChatList(scrollController: _archiveScrollController);
        break;
      default:
        tab = const SizedBox();
    }

    _builtTabs[index] = tab;
    return tab;
  }

  void _onScroll() {
    if (AppUtils.isBottomOfList(_scrollController)) {
      cubit.loadMoreChats(query: query);
    }
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<ChatsCubit>();
    _scrollController.addListener(_onScroll);
    _archiveScrollController.addListener(_onScroll);
    _tabController = TabController(
      initialIndex: initialIndex ?? 0,
      length: tabCount,
      vsync: this,
    );
    _currentIndex = _tabController.index;
    _tabController.addListener(() {
      if (_tabController.index != _currentIndex) {
        _currentIndex = _tabController.index;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _archiveScrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _archiveScrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<ChatsCubit, ChatsState>(
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
      child: Padding(
        padding: const .symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Padding(
              padding: const .symmetric(vertical: 16.0),
              child: AppSearchBar(
                onChanged: (query) {
                  query = query;
                  cubit.loadAllChats(query: query);
                },
              ),
            ),
            Builder(
              key: ValueKey(context.locale),
              builder: (context) {
                return CustomTabBar(
                  tabs: [
                    'chatsScreen.tabs.active'.tr(),
                    'chatsScreen.tabs.archive'.tr(),
                  ],
                  selectedIndex: _tabController.index,
                  useDifferentBorderForOuter: true,
                  onTap: (i) {
                    _tabController.animateTo(i);
                    if (i == 0) {
                      cubit.setScreenStatus(ChatsScreenStatus.active);
                    } else {
                      cubit.setScreenStatus(ChatsScreenStatus.archive);
                    }
                  },
                  barDecoration: const BoxDecoration(color: Colors.transparent),
                  barPadding: const EdgeInsets.symmetric(vertical: 8.0),
                  buttonBorderRadius: 12.0,
                  buttonColor: theme.unselectedWidgetColor,
                  labelColor: theme.disabledColor,
                  selectedButtonColor: theme.colorScheme.primary,
                  selectedLabelColor: Colors.white,
                  separator: const SizedBox(),
                  fontSize: 14.0,
                );
              },
            ),
            Expanded(
              child: IndexedStack(
                index: _tabController.index,
                children: List.generate(tabCount, _buildTab),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

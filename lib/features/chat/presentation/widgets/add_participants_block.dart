import 'package:chatting_app/features/chat/presentation/widgets/participants_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/presentation/widgets/app_loader.dart';
import '../../../../core/presentation/widgets/app_search_bar.dart';
import '../../../../core/presentation/widgets/slide_down_animated_widget.dart';
import '../../../users/presentation/cubit/cubit.dart';
import '../../../users/presentation/cubit/state.dart';
import '../cubit/cubit.dart';
import 'added_participants_list.dart';

class AddParticipantsBlock extends StatefulWidget {
  const AddParticipantsBlock({super.key, this.title});

  final String? title;

  @override
  State<AddParticipantsBlock> createState() => _AddParticipantsBlockState();
}

class _AddParticipantsBlockState extends State<AddParticipantsBlock> {
  late ChatCubit chatCubit;
  late UsersCubit usersCubit;
  final _scrollController = ScrollController();
  String query = '';

  void _onScroll() {
    if (AppUtils.isBottomOfList(_scrollController)) {
      usersCubit.loadMoreUsers(query: query);
    }
  }

  @override
  void initState() {
    super.initState();
    chatCubit = context.read<ChatCubit>();
    usersCubit = context.read<UsersCubit>();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = context.watch<ChatCubit>().state;
    final blockTitle = chatState.status == CreateGroupStatus.setName
        ? 'createGroupScreen.setName'.tr()
        : 'createGroupScreen.addParticipants'.tr();
    return Column(
      mainAxisSize: .min,
      children: [
        const SizedBox(height: 16.0),
        Column(
          crossAxisAlignment: .start,
          spacing: 8.0,
          children: [
            Row(
              children: [
                Text(widget.title ?? blockTitle, textAlign: TextAlign.start),
              ],
            ),
            SlideDownAnimatedWidget(
              duration: 500,
              child: chatState.selectedParticipants.isNotEmpty
                  ? AddedParticipantsList(
                      participants: chatState.selectedParticipants,
                      onTap: (participant) {
                        chatCubit.removeParticipant(participant);
                      },
                    )
                  : const SizedBox.shrink(),
            ),
            if (chatState.selectedParticipants.isNotEmpty) const Divider(),
          ],
        ),
        BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            final isLoading = state.isLoading;
            return isLoading
                ? const Center(child: AppLoader())
                : Column(
                    crossAxisAlignment: .stretch,
                    children: [
                      Padding(
                        padding: const .symmetric(vertical: 16.0),
                        child: AppSearchBar(
                          onChanged: (query) {
                            query = query;
                            usersCubit.loadUsers(query: query);
                          },
                        ),
                      ),
                      Stack(
                        children: [
                          ParticipantsList(
                            scrollController: _scrollController,
                            participants: state.users,
                            onAddTap: (participant) {
                              chatCubit.addParticipant(participant);
                            },
                          ),
                          if (state.showLoader)
                            const Positioned(
                              left: 0,
                              bottom: 0,
                              right: 0,
                              child: AppLoader(size: 20.0),
                            ),
                        ],
                      ),
                    ],
                  );
          },
        ),
      ],
    );
  }
}

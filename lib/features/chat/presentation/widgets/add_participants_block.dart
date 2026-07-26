import 'package:chatting_app/features/chat/presentation/widgets/participants_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/app_loader.dart';
import '../../../../core/presentation/widgets/slide_down_animated_widget.dart';
import '../../../users/presentation/users_cubit/cubit.dart';
import '../../../users/presentation/users_cubit/state.dart';
import '../cubit/cubit.dart';
import 'added_participants_list.dart';

class AddParticipantsBlock extends StatelessWidget {
  const AddParticipantsBlock({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    final chatCubit = context.read<ChatCubit>();
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
              children: [Text(title ?? blockTitle, textAlign: TextAlign.start)],
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
                : ParticipantsList(
                    participants: state.users,
                    onAddTap: (participant) {
                      chatCubit.addParticipant(participant);
                    },
                  );
          },
        ),
      ],
    );
  }
}

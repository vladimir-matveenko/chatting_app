import 'package:chatting_app/core/presentation/widgets/text_fields/app_text_form_field.dart';
import 'package:chatting_app/features/chat/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/chat/presentation/widgets/participants_list.dart';
import 'package:chatting_app/features/chat/utils.dart';
import 'package:chatting_app/features/profile/domain/repository/profile_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';

class SetGroupNameBlock extends StatefulWidget {
  const SetGroupNameBlock({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<SetGroupNameBlock> createState() => _SetGroupNameBlockState();
}

class _SetGroupNameBlockState extends State<SetGroupNameBlock> {
  final _userProfile = getIt<ProfileRepository>().profile;
  late ChatCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ChatCubit>();
    widget.controller.text = ChatUtils.buildGroupName(
      _userProfile?.displayName ?? _userProfile?.userName ?? '',
      cubit.state.selectedParticipants,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = context.watch<ChatCubit>().state;
    return Padding(
      padding: const .only(top: 16.0),
      child: Column(
        spacing: 16.0,
        crossAxisAlignment: .start,
        children: [
          Row(
            spacing: 8.0,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  fixedSize: const Size(48.0, 48.0),
                  padding: const .all(10.0),
                ),
                child: const Icon(Icons.add_a_photo),
              ),
              Expanded(child: AppTextFormField(controller: widget.controller)),
            ],
          ),
          Container(
            padding: const .all(16.0),
            decoration: BoxDecoration(
              color: theme.bottomNavigationBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                Text(
                  'createGroupScreen.participants'.plural(
                    state.selectedParticipants.length,
                  ),
                  style: theme.textTheme.bodyMedium,
                ),
                ParticipantsList(
                  participants: state.selectedParticipants,
                  onAddTap: (user) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

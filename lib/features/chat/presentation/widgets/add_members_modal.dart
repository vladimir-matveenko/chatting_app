import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/utils/extensions.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import 'add_participants_block.dart';

class AddMembersModal extends StatelessWidget {
  const AddMembersModal({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final isLandscape = context.isLandscape();
    final cubit = context.read<ChatCubit>();

    return Container(
      constraints: BoxConstraints(
        maxHeight: isLandscape
            ? screenSize.height - 32.0
            : screenSize.height * 0.7,
        maxWidth: isLandscape
            ? screenSize.height - 32.0
            : screenSize.width - 32.0,
      ),
      padding: const .all(16.0),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          if (state.closeModal) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.canPop()) {
                context.pop();
              }
            });
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: .min,
            children: [
              AddParticipantsBlock(
                title: 'createGroupScreen.addParticipants'.tr(),
              ),
              Row(
                mainAxisAlignment: .end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const .all(8.0),
                      fixedSize: const Size(48.0, 48.0),
                    ),
                    onPressed: () {
                      final ids = state.selectedParticipants
                          .map((e) => e.id)
                          .toList();
                      cubit.addChatMember(
                        chatId: state.chat?.id ?? '',
                        memberIds: ids,
                      );
                    },
                    child: const Icon(Icons.check, size: 24.0),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:chatting_app/features/chat/domain/entity/chat_member_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/presentation/widgets/avatar_with_name.dart';
import '../../../../core/presentation/widgets/base_list_view.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class ChangeOwnerModal extends StatelessWidget {
  const ChangeOwnerModal({super.key, required this.ownerId});

  final String ownerId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final cubit = context.read<ChatCubit>();

    return Container(
      constraints: AppUtils.getModalDialogConstraints(context),
      padding: const .all(16.0),
      child: BlocConsumer<ChatCubit, ChatState>(
        listenWhen: (prev, current) =>
            prev.closeModal != current.closeModal && current.closeModal,
        listener: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.canPop()) {
              context.pop();
            }
          });
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: .min,
            children: [
              Row(
                spacing: 4.0,
                children: [
                  Text(
                    '${'editChatScreen.newOwner'.tr()}:',
                    style: textTheme.bodyMedium,
                  ),
                  if (state.selectedMember != null)
                    Text(
                      state.selectedMember?.displayName ??
                          state.selectedMember?.userName ??
                          '',
                      style: textTheme.bodyMedium,
                    ),
                ],
              ),
              BaseListView<ChatMemberEntity>(
                items: state.chatMembers,
                itemBuilder: (context, index) {
                  final user = state.chatMembers[index];
                  return GestureDetector(
                    behavior: .translucent,
                    onTap: ownerId == user.userId
                        ? null
                        : () {
                            cubit.selectChatMember(user);
                          },
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        AvatarWithName(
                          avatar: user.avatarUrl ?? '',
                          userName: user.displayName ?? user.userName,
                          isOnline: user.isOnline,
                        ),
                        if (state.selectedMember?.userId == user.userId)
                          const Icon(Icons.check, size: 24),
                        if (ownerId == user.userId)
                          Text(
                            'chatScreen.owner'.tr(),
                            style: textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                      ],
                    ),
                  );
                },
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
                      if (state.selectedMember != null) {
                        cubit.changeOwner(
                          chatId: state.chat?.id ?? '',
                          userId: state.selectedMember?.userId ?? '',
                        );
                      } else {
                        context.pop();
                      }
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

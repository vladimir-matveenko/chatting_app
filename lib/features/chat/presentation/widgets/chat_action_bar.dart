import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/app/utils/extensions.dart';
import 'package:chatting_app/features/chat/presentation/cubit/cubit.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/widgets/app_dialog.dart';

class ChatActionBar extends StatelessWidget {
  const ChatActionBar({super.key, required this.currentUserId});

  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    final state = context.watch<ChatCubit>().state;
    final currentUser = state.chatMembers.firstWhereOrNull(
      (e) => e.userId == currentUserId,
    );
    final screenSize = MediaQuery.sizeOf(context);
    final isLandscape = context.isLandscape();
    return SizedBox(
      width: isLandscape ? screenSize.height - 32.0 : screenSize.width - 32.0,
      child: Row(
        spacing: 8.0,
        mainAxisAlignment: .center,
        children: [
          Expanded(
            child: ChatActionButton(
              onTap: () {
                if (context.canPop()) {
                  context.pop();
                }
              },
              icon: Icons.chat_bubble_outlined,
              text: 'chatScreen.screenName'.tr(),
            ),
          ),
          Expanded(
            child: ChatActionButton(
              onTap: () {
                cubit.muteChat(
                  chatId: state.chat?.id ?? '',
                  isMuted: !(currentUser?.isMuted ?? false),
                );
              },
              icon: currentUser?.isMuted == true
                  ? Icons.notifications_off_rounded
                  : Icons.notifications_active_rounded,
              text: currentUser?.isMuted == true
                  ? 'chatScreen.muted'.tr()
                  : 'chatScreen.unmuted'.tr(),
            ),
          ),
          if (state.chat?.type == ChatType.group)
            Expanded(
              child: ChatActionButton(
                onTap: () async {
                  final result = await AppDialog.show(
                    context,
                    title: 'chatScreen.leavingChat.leaveChat'.tr(),
                    text: 'chatScreen.leavingChat.areYouSure'.tr(),
                    cancelText: 'cancelText'.tr(),
                    okText: 'okText'.tr(),
                  );
                  if (result) {
                    cubit.leaveChat(state.chat?.id ?? '');
                  }
                },
                icon: Icons.logout_outlined,
                text: 'chatScreen.leavingChat.leaveChat'.tr(),
              ),
            ),
        ],
      ),
    );
  }
}

class ChatActionButton extends StatelessWidget {
  const ChatActionButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.isDark()
            ? const Color(0x2638BDF8)
            : theme.scaffoldBackgroundColor,
        padding: const .all(8.0),
      ),
      child: Padding(
        padding: const .symmetric(vertical: 8.0),
        child: Column(
          children: [
            Icon(icon, size: 24.0, color: theme.colorScheme.primary),
            Text(
              text,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

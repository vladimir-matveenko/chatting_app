import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/features/chat/presentation/widgets/chat_action_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/presentation/widgets/app_message.dart';
import '../../../profile/domain/repository/profile_repository.dart';
import '../../utils.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../widgets/chat_info_widget.dart';
import '../widgets/members_list.dart';

class ChatSettingsScreen extends StatefulWidget {
  const ChatSettingsScreen({super.key});

  @override
  State<ChatSettingsScreen> createState() => _ChatSettingsScreenState();
}

class _ChatSettingsScreenState extends State<ChatSettingsScreen> {
  final _userProfile = getIt<ProfileRepository>().profile;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();

    return BlocConsumer<ChatCubit, ChatState>(
      builder: (context, state) {
        final isOnline = state.chat?.type == ChatType.private
            ? ChatUtils.getPrivateChatMember(
                    yourId: _userProfile?.id ?? '',
                    members: state.chatMembers,
                  )?.isOnline ??
                  false
            : false;
        return Padding(
          padding: const .symmetric(horizontal: 16.0),
          child: Column(
            spacing: 16.0,
            children: [
              Padding(
                padding: const .only(top: 16.0),
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    ChatInfoWidget(
                      chatType: state.chat?.type ?? ChatType.private,
                      isOnline: isOnline,
                      avatar: state.chat?.avatarUrl ?? '',
                      title: ChatUtils.buildChatTitle(
                        chatTitle: state.chat?.title ?? '',
                        members: state.chatMembers,
                      ),
                      membersCount: state.chat?.type == ChatType.group
                          ? 'createGroupScreen.participants'.plural(
                              state.chatMembers.length,
                            )
                          : null,
                    ),
                  ],
                ),
              ),
              ChatActionBar(currentUserId: _userProfile?.id ?? ''),
              if (state.chat?.type == ChatType.group) ...[
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    spacing: 8.0,
                    mainAxisSize: .min,
                    children: [
                      const Icon(Icons.person_add_outlined),
                      Text('editChatScreen.addMember'.tr()),
                    ],
                  ),
                ),
                MembersList(
                  participants: state.chatMembers,
                  onDeleteTap: (member) {
                    cubit.deleteChatMember(
                      chatId: state.chat?.id ?? '',
                      userId: member.userId,
                    );
                  },
                ),
              ],
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state.error?.isNotEmpty == true) {
          AppMessage.error(
            context,
            message: state.error!,
            onClose: cubit.disableError,
          );
        }
      },
    );
  }
}

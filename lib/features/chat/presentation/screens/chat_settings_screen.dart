import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/app_message.dart';
import '../../utils.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../widgets/chat_info_widget.dart';
import '../widgets/members_list.dart';

class ChatSettingsScreen extends StatelessWidget {
  const ChatSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();

    return BlocConsumer<ChatCubit, ChatState>(
      builder: (context, state) {
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

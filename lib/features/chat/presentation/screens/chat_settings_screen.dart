import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/core/presentation/widgets/app_back_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../widgets/chat_info_widget.dart';
import '../widgets/members_list.dart';

class ChatSettingsScreen extends StatelessWidget {
  const ChatSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButton(),
            actions: [
              if (state.chat?.type == ChatType.group)
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, size: 20.0),
                ),
            ],
          ),
          body: Column(
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
                    context.read<ChatCubit>().deleteChatMember(
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
        if (state.updateMembers) {
          context.read<ChatCubit>().getChatMembers(
            chatId: state.chat?.id ?? '',
          );
        }
      },
    );
  }
}

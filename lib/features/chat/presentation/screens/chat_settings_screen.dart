import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/core/presentation/widgets/app_back_button.dart';
import 'package:chatting_app/core/presentation/widgets/app_dialog.dart';
import 'package:chatting_app/features/chat/presentation/widgets/edit_group_block.dart';
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
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButton(),
            actions: [
              if (state.chat?.type == ChatType.group)
                Padding(
                  padding: const .only(right: 8.0),
                  child: IconButton(
                    onPressed: () {
                      AppDialog.empty(
                        context,
                        content: const EditGroupBlock(),
                        onClose: cubit.disableCloseModal,
                      );
                    },
                    icon: const Icon(Icons.edit, size: 20.0),
                  ),
                ),
            ],
          ),
          body: Padding(
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

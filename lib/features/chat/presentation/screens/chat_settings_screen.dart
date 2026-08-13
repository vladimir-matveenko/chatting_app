import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/app/utils/extensions.dart';
import 'package:chatting_app/features/chat/presentation/widgets/add_members_modal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/presentation/widgets/app_dialog.dart';
import '../../../../core/presentation/widgets/sliver_separated_list.dart';
import '../../../profile/domain/repository/profile_repository.dart';
import '../../utils.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../widgets/chat_action_bar.dart';
import '../widgets/chat_header/chat_details_sliver_app_bar.dart';
import '../widgets/edit_chat_button.dart';
import '../widgets/member_list_item.dart';

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

    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final isOnline = state.chat?.type == ChatType.private
            ? ChatUtils.getPrivateChatMember(
                    yourId: _userProfile?.id ?? '',
                    members: state.chatMembers,
                  )?.isOnline ??
                  false
            : false;

        final title = ChatUtils.buildChatTitle(
          chatTitle: state.chat?.title ?? '',
          members: state.chatMembers,
          yourId: _userProfile?.id ?? '',
        );

        final subtitle = state.chat?.type == ChatType.group
            ? 'createGroupScreen.participants'.plural(state.chatMembers.length)
            : (isOnline ? 'chatScreen.online'.tr() : 'chatScreen.offline'.tr());

        return CustomScrollView(
          slivers: [
            ChatDetailsSliverAppBar(
              avatar: state.chat?.avatarUrl ?? '',
              title: title,
              subtitle: subtitle,
              chatType: state.chat?.type ?? ChatType.private,
              isOnline: isOnline,
              actions: const [EditChatButton()],
              actionBar: ChatActionBar(currentUserId: _userProfile?.id ?? ''),
            ),

            if (state.chat?.type == ChatType.group) ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: OutlinedButton(
                    onPressed: () {
                      AppDialog.empty(
                        context,
                        content: const AddMembersModal(),
                        onClose: cubit.disableCloseModal,
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.person_add_outlined),
                        const SizedBox(width: 8),
                        Text('editChatScreen.addMember'.tr()),
                      ],
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverSeparatedList(
                  itemCount: state.chatMembers.length,
                  itemBuilder: (context, index) {
                    final member = state.chatMembers[index];
                    final areYou = _userProfile?.id == member.userId;
                    final yourRole = state.me?.role ?? ChatMemberRole.member;

                    final canManageMember =
                        !member.role.isOwner &&
                        (yourRole.isOwner ||
                            (yourRole.isAdmin && member.role.isMember));

                    final canRemoveMember = !areYou && canManageMember;
                    final canChangeRole = canManageMember;

                    return MembersListItem(
                      key: ValueKey(member.userId),
                      user: member,
                      areYou: areYou,
                      swipeLeftAction: canRemoveMember
                          ? () {
                              cubit.deleteChatMember(
                                chatId: member.chatId,
                                userId: member.userId,
                              );
                            }
                          : null,
                      swipeRightAction: canChangeRole
                          ? () {
                              final newRole = member.role.isAdmin
                                  ? ChatMemberRole.member
                                  : ChatMemberRole.admin;
                              cubit.changeMemberRole(
                                chatId: member.chatId,
                                userId: member.userId,
                                role: newRole,
                              );
                            }
                          : null,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 16,
                      thickness: 1,
                      color: Theme.of(context).unselectedWidgetColor,
                    );
                  },
                ),
              ),

              const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
            ],
          ],
        );
      },
    );
  }
}

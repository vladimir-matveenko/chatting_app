import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/app/router/app_routes.dart';
import 'package:chatting_app/features/chat/domain/entity/chat_member_entity.dart';
import 'package:chatting_app/features/chat/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/chat/presentation/cubit/state.dart';
import 'package:chatting_app/features/chat/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/utils/extensions.dart';
import '../../../../core/presentation/widgets/avatar_stack.dart';
import '../../../profile/domain/repository/profile_repository.dart';

class ChatParticipantsBar extends StatefulWidget {
  const ChatParticipantsBar({super.key});

  @override
  State<ChatParticipantsBar> createState() => _ChatParticipantsBarState();
}

class _ChatParticipantsBarState extends State<ChatParticipantsBar> {
  final _userProfile = getIt<ProfileRepository>().profile;

  List<ChatMemberEntity> getShortMembersList(List<ChatMemberEntity> members) {
    final tmp = List<ChatMemberEntity>.from(members);
    tmp.removeWhere((e) => e.userId == (_userProfile?.id ?? ''));
    final end = tmp.length.min(2);
    return tmp.getRange(0, end).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final anotherParticipants = getShortMembersList(state.chatMembers);
        final avatars = anotherParticipants
            .map((e) => e.avatarUrl ?? '')
            .toList();
        final names = anotherParticipants
            .map((e) => e.displayName ?? e.userName)
            .toList();
        return state.isLoading
            ? const SizedBox()
            : GestureDetector(
                onTap: () {
                  context.push(AppRoutes.chatSettings);
                },
                child: Container(
                  padding: const .all(16.0),
                  color: theme.bottomNavigationBarTheme.backgroundColor,
                  child: Row(
                    spacing: 8.0,
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .center,
                    children: [
                      AvatarStack(
                        avatarSize: 30.0,
                        imageUrls: avatars,
                        names: names,
                        placeholderBackgroundColor: theme.unselectedWidgetColor,
                        borderColor: theme.isDark()
                            ? Colors.white
                            : Colors.grey.shade500,
                      ),
                      Column(
                        children: [
                          Text(
                            ChatUtils.buildChatTitle(
                              chatTitle: state.chat?.title ?? '',
                              members: state.chatMembers,
                            ),
                            style: theme.textTheme.bodyMedium,
                          ),
                          if (state.chat?.type == ChatType.group)
                            Text(
                              'createGroupScreen.participants'.plural(
                                state.chatMembers.length,
                              ),
                              style: theme.textTheme.bodySmall,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

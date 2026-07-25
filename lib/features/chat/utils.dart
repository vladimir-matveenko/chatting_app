import 'package:chatting_app/features/chat/domain/entity/chat_member_entity.dart';
import 'package:chatting_app/features/users/domain/entity/users_list_item_entity.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChatUtils {
  static String buildGroupName(
    String currentUserName,
    List<UserListItemEntity> participants,
  ) {
    String result = '';
    final firstParticipant =
        participants.first.displayName ?? participants.first.userName;
    if (participants.length > 1) {
      result =
          '$currentUserName, $firstParticipant ${'and'.tr()} ${'other'.plural(participants.length - 1)}';
    } else {
      result = '$currentUserName ${'and'.tr()} $firstParticipant';
    }
    return result;
  }

  static String buildChatTitle({
    required String chatTitle,
    required List<ChatMemberEntity> members,
  }) {
    if (chatTitle.isNotEmpty) {
      return chatTitle;
    }
    if (members.isEmpty) {
      return '';
    }
    final firstMember = members.first;
    return firstMember.displayName ?? firstMember.userName;
  }

  static ChatMemberEntity? getPrivateChatMember({
    required String yourId,
    required List<ChatMemberEntity> members,
  }) {
    return members.firstWhereOrNull((e) => e.userId != yourId);
  }

  static Widget buildMemberStatusWidget({
    required String yourId,
    required List<ChatMemberEntity> members,
    required TextStyle onlineStyle,
    required TextStyle offlineStyle,
  }) {
    final isOnline =
        getPrivateChatMember(yourId: yourId, members: members)?.isOnline ==
        true;
    return Text(
      isOnline ? 'chatScreen.online'.tr() : 'chatScreen.offline'.tr(),
      style: isOnline ? onlineStyle : offlineStyle,
    );
  }
}

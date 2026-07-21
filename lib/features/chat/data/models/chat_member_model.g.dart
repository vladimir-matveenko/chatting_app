// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMemberModel _$ChatMemberModelFromJson(Map<String, dynamic> json) =>
    _ChatMemberModel(
      chatId: json['chatId'] as String,
      userId: json['userId'] as String,
      role: $enumDecode(_$ChatMemberRoleEnumMap, json['role']),
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      lastReadMessageId: json['lastReadMessageId'] as String?,
      isMuted: json['isMuted'] as bool,
      isArchived: json['isArchived'] as bool,
      displayName: json['displayName'] as String?,
      userName: json['userName'] as String,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$ChatMemberModelToJson(_ChatMemberModel instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'userId': instance.userId,
      'role': _$ChatMemberRoleEnumMap[instance.role]!,
      'joinedAt': instance.joinedAt.toIso8601String(),
      'lastReadMessageId': ?instance.lastReadMessageId,
      'isMuted': instance.isMuted,
      'isArchived': instance.isArchived,
      'displayName': ?instance.displayName,
      'userName': instance.userName,
      'avatarUrl': ?instance.avatarUrl,
    };

const _$ChatMemberRoleEnumMap = {
  ChatMemberRole.owner: 'owner',
  ChatMemberRole.admin: 'admin',
  ChatMemberRole.member: 'member',
};

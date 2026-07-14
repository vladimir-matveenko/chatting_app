// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_participant_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatListParticipantEntity _$ChatListParticipantEntityFromJson(
  Map<String, dynamic> json,
) => _ChatListParticipantEntity(
  username: json['username'] as String,
  displayName: json['displayName'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
);

Map<String, dynamic> _$ChatListParticipantEntityToJson(
  _ChatListParticipantEntity instance,
) => <String, dynamic>{
  'username': instance.username,
  'displayName': ?instance.displayName,
  'avatarUrl': ?instance.avatarUrl,
};

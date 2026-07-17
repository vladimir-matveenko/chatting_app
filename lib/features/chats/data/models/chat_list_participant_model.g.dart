// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatListParticipantModel _$ChatListParticipantModelFromJson(
  Map<String, dynamic> json,
) => _ChatListParticipantModel(
  userName: json['userName'] as String,
  displayName: json['displayName'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
);

Map<String, dynamic> _$ChatListParticipantModelToJson(
  _ChatListParticipantModel instance,
) => <String, dynamic>{
  'userName': instance.userName,
  'displayName': ?instance.displayName,
  'avatarUrl': ?instance.avatarUrl,
};

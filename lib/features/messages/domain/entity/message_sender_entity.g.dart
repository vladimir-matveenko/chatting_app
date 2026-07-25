// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_sender_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageSenderEntity _$MessageSenderEntityFromJson(Map<String, dynamic> json) =>
    _MessageSenderEntity(
      id: json['id'] as String,
      userName: json['userName'] as String,
      displayName: json['displayName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$MessageSenderEntityToJson(
  _MessageSenderEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'userName': instance.userName,
  'displayName': ?instance.displayName,
  'avatarUrl': ?instance.avatarUrl,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_sender_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageSenderModel _$MessageSenderModelFromJson(Map<String, dynamic> json) =>
    _MessageSenderModel(
      id: json['id'] as String,
      userName: json['userName'] as String,
      displayName: json['displayName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$MessageSenderModelToJson(_MessageSenderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'displayName': ?instance.displayName,
      'avatarUrl': ?instance.avatarUrl,
    };

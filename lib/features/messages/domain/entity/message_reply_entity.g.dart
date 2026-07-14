// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_reply_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageReplyEntity _$MessageReplyEntityFromJson(Map<String, dynamic> json) =>
    _MessageReplyEntity(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      body: json['body'] as String?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$MessageReplyEntityToJson(_MessageReplyEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'body': ?instance.body,
      'deletedAt': ?instance.deletedAt?.toIso8601String(),
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.video: 'video',
  MessageType.audio: 'audio',
  MessageType.file: 'file',
  MessageType.system: 'system',
};

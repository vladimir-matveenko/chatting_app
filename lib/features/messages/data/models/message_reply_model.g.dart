// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_reply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageReplyModel _$MessageReplyModelFromJson(Map<String, dynamic> json) =>
    _MessageReplyModel(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      body: json['body'] as String?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$MessageReplyModelToJson(_MessageReplyModel instance) =>
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_search_result_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageSearchResultEntity _$MessageSearchResultEntityFromJson(
  Map<String, dynamic> json,
) => _MessageSearchResultEntity(
  messageId: (json['messageId'] as num).toInt(),
  chatId: json['chatId'] as String,
  sender: MessageSenderEntity.fromJson(json['sender'] as Map<String, dynamic>),
  type: $enumDecode(_$MessageTypeEnumMap, json['type']),
  body: json['body'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MessageSearchResultEntityToJson(
  _MessageSearchResultEntity instance,
) => <String, dynamic>{
  'messageId': instance.messageId,
  'chatId': instance.chatId,
  'sender': instance.sender.toJson(),
  'type': _$MessageTypeEnumMap[instance.type]!,
  'body': ?instance.body,
  'createdAt': instance.createdAt.toIso8601String(),
};

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.video: 'video',
  MessageType.audio: 'audio',
  MessageType.file: 'file',
  MessageType.system: 'system',
};

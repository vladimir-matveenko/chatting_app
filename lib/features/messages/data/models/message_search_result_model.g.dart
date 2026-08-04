// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageSearchResultModel _$MessageSearchResultModelFromJson(
  Map<String, dynamic> json,
) => _MessageSearchResultModel(
  messageId: json['messageId'] as String,
  chatId: json['chatId'] as String,
  sender: MessageSenderModel.fromJson(json['sender'] as Map<String, dynamic>),
  type: $enumDecode(_$MessageTypeEnumMap, json['type']),
  body: json['body'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MessageSearchResultModelToJson(
  _MessageSearchResultModel instance,
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

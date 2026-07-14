// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      id: json['id'] as String,
      chatId: json['chatId'] as String,
      senderId: json['senderId'] as String,
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      body: json['body'] as String?,
      replyToId: json['replyToId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      isDeleted: json['isDeleted'] as bool? ?? false,
      reactions:
          (json['reactions'] as List<dynamic>?)
              ?.map(
                (e) => MessageReactionSummaryModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      reply: json['reply'] == null
          ? null
          : MessageReplyModel.fromJson(json['reply'] as Map<String, dynamic>),
      currentUserReaction: $enumDecodeNullable(
        _$ReactionTypeEnumMap,
        json['currentUserReaction'],
      ),
    );

Map<String, dynamic> _$MessageModelToJson(
  _MessageModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'chatId': instance.chatId,
  'senderId': instance.senderId,
  'type': _$MessageTypeEnumMap[instance.type]!,
  'body': ?instance.body,
  'replyToId': ?instance.replyToId,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'deletedAt': ?instance.deletedAt?.toIso8601String(),
  'isDeleted': instance.isDeleted,
  'reactions': instance.reactions.map((e) => e.toJson()).toList(),
  'reply': ?instance.reply?.toJson(),
  'currentUserReaction': ?_$ReactionTypeEnumMap[instance.currentUserReaction],
};

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.video: 'video',
  MessageType.audio: 'audio',
  MessageType.file: 'file',
  MessageType.system: 'system',
};

const _$ReactionTypeEnumMap = {
  ReactionType.like: 'like',
  ReactionType.dislike: 'dislike',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_reaction_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageReactionEntity _$MessageReactionEntityFromJson(
  Map<String, dynamic> json,
) => _MessageReactionEntity(
  id: json['id'] as String,
  messageId: json['messageId'] as String,
  type: $enumDecode(_$ReactionTypeEnumMap, json['type']),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MessageReactionEntityToJson(
  _MessageReactionEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'messageId': instance.messageId,
  'type': _$ReactionTypeEnumMap[instance.type]!,
  'createdAt': instance.createdAt.toIso8601String(),
};

const _$ReactionTypeEnumMap = {
  ReactionType.like: 'like',
  ReactionType.dislike: 'dislike',
};

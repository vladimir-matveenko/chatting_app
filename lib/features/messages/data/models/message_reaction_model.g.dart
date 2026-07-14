// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_reaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageReactionModel _$MessageReactionModelFromJson(
  Map<String, dynamic> json,
) => _MessageReactionModel(
  id: json['id'] as String,
  messageId: json['messageId'] as String,
  type: $enumDecode(_$ReactionTypeEnumMap, json['type']),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MessageReactionModelToJson(
  _MessageReactionModel instance,
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

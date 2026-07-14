// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_reaction_summary_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageReactionSummaryEntity _$MessageReactionSummaryEntityFromJson(
  Map<String, dynamic> json,
) => _MessageReactionSummaryEntity(
  type: $enumDecode(_$ReactionTypeEnumMap, json['type']),
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$MessageReactionSummaryEntityToJson(
  _MessageReactionSummaryEntity instance,
) => <String, dynamic>{
  'type': _$ReactionTypeEnumMap[instance.type]!,
  'count': instance.count,
};

const _$ReactionTypeEnumMap = {
  ReactionType.like: 'like',
  ReactionType.dislike: 'dislike',
};

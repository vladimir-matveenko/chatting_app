// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_reaction_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageReactionSummaryModel _$MessageReactionSummaryModelFromJson(
  Map<String, dynamic> json,
) => _MessageReactionSummaryModel(
  type: $enumDecode(_$ReactionTypeEnumMap, json['type']),
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$MessageReactionSummaryModelToJson(
  _MessageReactionSummaryModel instance,
) => <String, dynamic>{
  'type': _$ReactionTypeEnumMap[instance.type]!,
  'count': instance.count,
};

const _$ReactionTypeEnumMap = {
  ReactionType.like: 'like',
  ReactionType.dislike: 'dislike',
};

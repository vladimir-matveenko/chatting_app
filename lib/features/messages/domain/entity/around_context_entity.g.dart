// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'around_context_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AroundContextEntity _$AroundContextEntityFromJson(Map<String, dynamic> json) =>
    _AroundContextEntity(
      targetMessageId: json['targetMessageId'] as String,
      hasPrevious: json['hasPrevious'] as bool,
      hasNext: json['hasNext'] as bool,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AroundContextEntityToJson(
  _AroundContextEntity instance,
) => <String, dynamic>{
  'targetMessageId': instance.targetMessageId,
  'hasPrevious': instance.hasPrevious,
  'hasNext': instance.hasNext,
  'messages': instance.messages.map((e) => e.toJson()).toList(),
};

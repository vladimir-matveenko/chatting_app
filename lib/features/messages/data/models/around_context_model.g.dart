// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'around_context_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AroundContextModel _$AroundContextModelFromJson(Map<String, dynamic> json) =>
    _AroundContextModel(
      targetMessageId: json['targetMessageId'] as String,
      hasPrevious: json['hasPrevious'] as bool,
      hasNext: json['hasNext'] as bool,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AroundContextModelToJson(_AroundContextModel instance) =>
    <String, dynamic>{
      'targetMessageId': instance.targetMessageId,
      'hasPrevious': instance.hasPrevious,
      'hasNext': instance.hasNext,
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };

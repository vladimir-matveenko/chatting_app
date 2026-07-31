// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_page_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessagesPageEntity _$MessagesPageEntityFromJson(Map<String, dynamic> json) =>
    _MessagesPageEntity(
      hasPrevious: json['hasPrevious'] as bool,
      hasNext: json['hasNext'] as bool,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessagesPageEntityToJson(_MessagesPageEntity instance) =>
    <String, dynamic>{
      'hasPrevious': instance.hasPrevious,
      'hasNext': instance.hasNext,
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };

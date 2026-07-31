// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessagesPageModel _$MessagesPageModelFromJson(Map<String, dynamic> json) =>
    _MessagesPageModel(
      hasPrevious: json['hasPrevious'] as bool,
      hasNext: json['hasNext'] as bool,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessagesPageModelToJson(_MessagesPageModel instance) =>
    <String, dynamic>{
      'hasPrevious': instance.hasPrevious,
      'hasNext': instance.hasNext,
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };

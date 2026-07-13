// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatEntity _$ChatEntityFromJson(Map<String, dynamic> json) => _ChatEntity(
  id: json['id'] as String,
  type: $enumDecode(_$ChatTypeEnumMap, json['type']),
  title: json['title'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  ownerId: json['ownerId'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ChatEntityToJson(_ChatEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ChatTypeEnumMap[instance.type]!,
      'title': ?instance.title,
      'avatarUrl': ?instance.avatarUrl,
      'ownerId': ?instance.ownerId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ChatTypeEnumMap = {
  ChatType.private: 'private',
  ChatType.group: 'group',
};

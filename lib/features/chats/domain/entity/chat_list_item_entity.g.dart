// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatListItemEntity _$ChatListItemEntityFromJson(Map<String, dynamic> json) =>
    _ChatListItemEntity(
      id: json['id'] as String,
      type: $enumDecode(_$ChatTypeEnumMap, json['type']),
      title: json['title'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      ownerId: json['ownerId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      lastMessage: json['lastMessage'] as String?,
      lastMessageAt: json['lastMessageAt'] == null
          ? null
          : DateTime.parse(json['lastMessageAt'] as String),
      unreadCount: (json['unreadCount'] as num?)?.toInt(),
      participants: (json['participants'] as List<dynamic>)
          .map(
            (e) => ChatListParticipantModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      participantsCount: (json['participantsCount'] as num).toInt(),
    );

Map<String, dynamic> _$ChatListItemEntityToJson(_ChatListItemEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ChatTypeEnumMap[instance.type]!,
      'title': ?instance.title,
      'avatarUrl': ?instance.avatarUrl,
      'ownerId': ?instance.ownerId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'lastMessage': ?instance.lastMessage,
      'lastMessageAt': ?instance.lastMessageAt?.toIso8601String(),
      'unreadCount': ?instance.unreadCount,
      'participants': instance.participants.map((e) => e.toJson()).toList(),
      'participantsCount': instance.participantsCount,
    };

const _$ChatTypeEnumMap = {
  ChatType.private: 'private',
  ChatType.group: 'group',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationEntity _$NotificationEntityFromJson(Map<String, dynamic> json) =>
    _NotificationEntity(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      payload: NotificationPayloadEntity.fromJson(
        json['payload'] as Map<String, dynamic>,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isRead: json['isRead'] as bool,
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
    );

Map<String, dynamic> _$NotificationEntityToJson(_NotificationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'payload': instance.payload.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
      'isRead': instance.isRead,
      'readAt': ?instance.readAt?.toIso8601String(),
    };

const _$NotificationTypeEnumMap = {
  NotificationType.message: 'message',
  NotificationType.chatUpdated: 'chat_updated',
  NotificationType.adminGranted: 'admin_granted',
  NotificationType.adminRevoked: 'admin_revoked',
  NotificationType.memberAdded: 'member_added',
  NotificationType.memberRemoved: 'member_removed',
  NotificationType.chatInvite: 'chat_invite',
  NotificationType.ownerChanged: 'owner_changed',
  NotificationType.reaction: 'reaction',
  NotificationType.reply: 'reply',
};

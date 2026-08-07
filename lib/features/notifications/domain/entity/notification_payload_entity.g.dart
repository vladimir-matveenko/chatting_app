// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_payload_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationPayloadEntity _$NotificationPayloadEntityFromJson(
  Map<String, dynamic> json,
) => _NotificationPayloadEntity(
  chatId: json['chatId'] as String?,
  messageId: json['messageId'] as String?,
  senderId: json['senderId'] as String?,
  memberId: json['memberId'] as String?,
);

Map<String, dynamic> _$NotificationPayloadEntityToJson(
  _NotificationPayloadEntity instance,
) => <String, dynamic>{
  'chatId': ?instance.chatId,
  'messageId': ?instance.messageId,
  'senderId': ?instance.senderId,
  'memberId': ?instance.memberId,
};

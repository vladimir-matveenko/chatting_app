// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationPayloadModel _$NotificationPayloadModelFromJson(
  Map<String, dynamic> json,
) => _NotificationPayloadModel(
  chatId: json['chatId'] as String?,
  messageId: json['messageId'] as String?,
  senderId: json['senderId'] as String?,
  memberId: json['memberId'] as String?,
);

Map<String, dynamic> _$NotificationPayloadModelToJson(
  _NotificationPayloadModel instance,
) => <String, dynamic>{
  'chatId': ?instance.chatId,
  'messageId': ?instance.messageId,
  'senderId': ?instance.senderId,
  'memberId': ?instance.memberId,
};

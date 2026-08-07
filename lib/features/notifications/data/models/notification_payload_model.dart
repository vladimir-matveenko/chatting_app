import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/notification_payload_entity.dart';

part 'notification_payload_model.freezed.dart';
part 'notification_payload_model.g.dart';

@freezed
abstract class NotificationPayloadModel with _$NotificationPayloadModel {
  const factory NotificationPayloadModel({
    String? chatId,
    String? messageId,
    String? senderId,
    String? memberId,
  }) = _NotificationPayloadModel;

  factory NotificationPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationPayloadModelFromJson(json);
}

extension NotificationPayloadModelExt on NotificationPayloadModel {
  NotificationPayloadEntity toEntity() => NotificationPayloadEntity(
    chatId: chatId,
    messageId: messageId,
    senderId: senderId,
    memberId: memberId,
  );
}

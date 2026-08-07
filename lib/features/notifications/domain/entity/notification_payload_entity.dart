import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_payload_entity.freezed.dart';
part 'notification_payload_entity.g.dart';

@freezed
abstract class NotificationPayloadEntity with _$NotificationPayloadEntity {
  const factory NotificationPayloadEntity({
    String? chatId,
    String? messageId,
    String? senderId,
    String? memberId,
  }) = _NotificationPayloadEntity;

  factory NotificationPayloadEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationPayloadEntityFromJson(json);
}

import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/features/notifications/domain/entity/notification_payload_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';
part 'notification_entity.g.dart';

@freezed
abstract class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    required String id,
    required String userId,
    required NotificationType type,
    required NotificationPayloadEntity payload,
    required DateTime createdAt,
    required bool isRead,
    DateTime? readAt,
  }) = _NotificationEntity;

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);
}

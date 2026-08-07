import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/features/notifications/data/models/notification_payload_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/utils/app_utils.dart';
import '../../domain/entity/notification_entity.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required String userId,
    required NotificationType type,
    required NotificationPayloadModel payload,
    required DateTime createdAt,
    required bool isRead,
    DateTime? readAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  static List<NotificationModel> fromList(List<dynamic> list) {
    return AppUtils.parseList<NotificationModel>(
      list,
      NotificationModel.fromJson,
    );
  }
}

extension NotificationModelExt on NotificationModel {
  NotificationEntity toEntity() => NotificationEntity(
    id: id,
    userId: userId,
    type: type,
    payload: payload.toEntity(),
    createdAt: createdAt.toLocal(),
    isRead: isRead,
    readAt: readAt?.toLocal(),
  );
}

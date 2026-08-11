import 'package:chatting_app/features/notifications/domain/entity/notification_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/entity/availability_filter_entity.dart';

part 'state.freezed.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default([]) List<NotificationEntity> notifications,
    @Default([]) List<AvailabilityFilterEntity> filters,
    @Default(0) int unreadCount,
    String? error,
    @Default(false) bool isLoading,
    @Default(false) bool showLoader,
  }) = _NotificationsState;
}

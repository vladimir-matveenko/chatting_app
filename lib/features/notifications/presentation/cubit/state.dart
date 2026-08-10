import 'package:chatting_app/features/notifications/domain/entity/notification_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/domain/entity/availability_filter_entity.dart';

class NotificationsState extends Equatable {
  const NotificationsState({
    this.notifications = const [],
    this.filters = const [],
    this.error,
    this.isLoading = false,
    this.showLoader = false,
    this.unreadCount = 0,
  });

  final List<NotificationEntity> notifications;
  final List<AvailabilityFilterEntity> filters;
  final int unreadCount;
  final String? error;
  final bool isLoading;
  final bool showLoader;

  NotificationsState copyWith({
    List<NotificationEntity>? notifications,
    List<AvailabilityFilterEntity>? filters,
    String? error,
    bool? isLoading,
    bool? shouldNavigate,
    bool? showLoader,
    int? unreadCount,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      filters: filters ?? this.filters,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      showLoader: showLoader ?? this.showLoader,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }

  @override
  List<dynamic> get props => [
    notifications,
    filters,
    error,
    isLoading,
    showLoader,
    unreadCount,
  ];
}

import 'dart:async';

import 'package:chatting_app/core/domain/entity/availability_filter_entity.dart';
import 'package:chatting_app/features/notifications/data/socket/notifications_socket_service.dart';
import 'package:chatting_app/features/notifications/domain/usecases/get_unread_count_usecase.dart';
import 'package:chatting_app/features/notifications/domain/usecases/mark_all_as_read_usecase.dart';
import 'package:chatting_app/features/notifications/domain/usecases/mark_one_as_read_usecase.dart';
import 'package:chatting_app/features/notifications/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../data/enums/notification_type.dart';
import '../../domain/usecases/load_notifications_usecase.dart';

@lazySingleton
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(
    this._loadNotificationsUseCase,
    this._getUnreadCountUseCase,
    this._markAllAsReadUseCase,
    this._markOneAsReadUseCase,
    this._notificationSocketService,
  ) : super(const NotificationsState()) {
    _subscribeSocketEvents();
  }

  final LoadNotificationsUseCase _loadNotificationsUseCase;
  final GetUnreadCountUseCase _getUnreadCountUseCase;
  final MarkAllAsReadUseCase _markAllAsReadUseCase;
  final MarkOneAsReadUseCase _markOneAsReadUseCase;
  final NotificationSocketService _notificationSocketService;

  final int defaultLimit = 20;

  final List<StreamSubscription> _subscriptions = [];

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }

    return super.close();
  }

  void _subscribeSocketEvents() {
    _subscriptions.add(
      _notificationSocketService.refreshData.listen((_) async {
        await loadData();
      }),
    );
  }

  Future<void> loadData({bool loadSilent = true}) async {
    await loadNotifications(loadSilent: loadSilent);
    await getUnreadCount();
  }

  Future<void> loadNotifications({bool loadSilent = true}) async {
    emit(state.copyWith(isLoading: !loadSilent));
    final list = await _loadNotificationsUseCase(
      LoadNotificationsParams(
        type: state.filters.isNotEmpty ? state.filters.first.apiValue : null,
        limit: defaultLimit,
        offset: 0,
      ),
    );
    list.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            notifications: [],
          ),
        );
      },
      (r) {
        emit(state.copyWith(notifications: r, isLoading: false));
      },
    );
  }

  Future<void> loadMoreNotifications({NotificationType? type}) async {
    if (state.notifications.length < defaultLimit) {
      return;
    }
    emit(state.copyWith(showLoader: true));
    final list = await _loadNotificationsUseCase(
      LoadNotificationsParams(
        type: type,
        offset: state.notifications.length,
        limit: defaultLimit,
      ),
    );
    list.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            showLoader: false,
          ),
        );
      },
      (r) {
        final existingIds = state.notifications.map((e) => e.id).toSet();

        final users = AppUtils.mergeBy(
          state.notifications,
          r.where((m) => !existingIds.contains(m.id)).toList(),
          getId: (m) => m.id,
        );

        emit(state.copyWith(notifications: users, showLoader: false));
      },
    );
  }

  Future<void> markOneAsRead(String id) async {
    final result = await _markOneAsReadUseCase(MarkOneAsReadParams(id));
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        loadNotifications();
      },
    );
  }

  Future<void> marlAllAsRead() async {
    final result = await _markAllAsReadUseCase(NoParams());
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        loadNotifications();
      },
    );
  }

  Future<void> getUnreadCount() async {
    final result = await _getUnreadCountUseCase(NoParams());
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(unreadCount: r));
      },
    );
  }

  Future<void> addFilter(AvailabilityFilterEntity filter) async {
    final filters = List<AvailabilityFilterEntity>.from(state.filters);
    // only one selected value available
    final contains = filters.any((e) => e == filter);
    filters.clear();
    if (!contains) {
      filters.add(filter);
    }
    emit(state.copyWith(filters: filters));
    loadNotifications();
  }

  Future<void> disableFilters() async {
    emit(state.copyWith(filters: []));
    loadNotifications();
  }

  Future<void> disableError() async {
    emit(state.copyWith(error: null));
  }
}

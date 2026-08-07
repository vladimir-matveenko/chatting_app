import 'package:chatting_app/features/notifications/data/models/notification_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/mapper.dart';
import '../../domain/entity/notification_entity.dart';
import '../../domain/repository/notifications_repository.dart';
import '../data_sources/notifications_remote_data_source.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationRepositoryImpl implements NotificationsRepository {
  NotificationRepositoryImpl(this._dataSource);

  final NotificationsRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, List<NotificationEntity>>> loadNotifications({
    NotificationType? type,
    int? limit,
    int? offset,
  }) async {
    try {
      final list = await _dataSource.loadNotifications(
        type: type,
        limit: limit,
        offset: offset,
      );
      return Right(list.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, int>> getUnreadCount() async {
    try {
      final result = await _dataSource.getUnreadCount();
      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> markAllAsRead() async {
    try {
      final result = await _dataSource.markAllAsRead();
      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, NotificationEntity>> markAsRead(String id) async {
    try {
      final result = await _dataSource.markAsRead(id);
      return Right(result!.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}

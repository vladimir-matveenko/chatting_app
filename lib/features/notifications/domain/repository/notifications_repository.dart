import 'package:dartz/dartz.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/error/failure.dart';
import '../entity/notification_entity.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, List<NotificationEntity>>> loadNotifications({
    NotificationType? type,
    int? limit,
    int? offset,
  });

  Future<Either<Failure, NotificationEntity>> markAsRead(String id);

  Future<Either<Failure, bool>> markAllAsRead();

  Future<Either<Failure, int>> getUnreadCount();
}

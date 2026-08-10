import 'package:chatting_app/features/notifications/domain/repository/notifications_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entity/notification_entity.dart';

@lazySingleton
class LoadNotificationsUseCase
    implements UseCase<List<NotificationEntity>, LoadNotificationsParams> {
  LoadNotificationsUseCase(this._repository);

  final NotificationsRepository _repository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
    LoadNotificationsParams params,
  ) async {
    return await _repository.loadNotifications(
      type: params.type,
      limit: params.limit,
      offset: params.offset,
    );
  }
}

class LoadNotificationsParams {
  LoadNotificationsParams({this.type, this.limit, this.offset});

  final NotificationType? type;
  final int? limit;
  final int? offset;
}

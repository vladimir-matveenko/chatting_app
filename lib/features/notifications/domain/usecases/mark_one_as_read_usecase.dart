import 'package:chatting_app/features/notifications/domain/entity/notification_entity.dart';
import 'package:chatting_app/features/notifications/domain/repository/notifications_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';

@lazySingleton
class MarkOneAsReadUseCase
    implements UseCase<NotificationEntity, MarkOneAsReadParams> {
  MarkOneAsReadUseCase(this._repository);

  final NotificationsRepository _repository;

  @override
  Future<Either<Failure, NotificationEntity>> call(params) async {
    return await _repository.markAsRead(params.id);
  }
}

class MarkOneAsReadParams {
  MarkOneAsReadParams(this.id);

  final String id;
}

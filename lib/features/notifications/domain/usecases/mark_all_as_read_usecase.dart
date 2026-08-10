import 'package:chatting_app/features/notifications/domain/repository/notifications_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';

@lazySingleton
class MarkAllAsReadUseCase implements UseCase<bool, NoParams> {
  MarkAllAsReadUseCase(this._repository);

  final NotificationsRepository _repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.markAllAsRead();
  }
}

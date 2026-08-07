import 'package:chatting_app/features/notifications/domain/repository/notifications_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class GetUnreadCountUseCase implements UseCase<int, NoParams> {
  GetUnreadCountUseCase(this._repository);

  final NotificationsRepository _repository;

  @override
  Future<Either<Failure, int>> call(params) async {
    return await _repository.getUnreadCount();
  }
}

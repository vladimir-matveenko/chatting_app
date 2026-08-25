import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/auth_repository.dart';

@lazySingleton
class CheckServerUseCase implements UseCase<bool, NoParams> {
  CheckServerUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _repository.isServerReady();
  }
}

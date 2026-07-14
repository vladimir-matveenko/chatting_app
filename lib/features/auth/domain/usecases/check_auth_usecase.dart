import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/auth_repository.dart';

@lazySingleton
class CheckAuthUseCase implements UseCase<bool, NoParams> {
  CheckAuthUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _repository.isAuthenticated();
  }
}

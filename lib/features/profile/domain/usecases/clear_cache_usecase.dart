import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/profile_repository.dart';

@lazySingleton
class ClearCacheUseCase implements UseCase<void, NoParams> {
  ClearCacheUseCase(this._repository);

  final ProfileRepository _repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _repository.clearCache();
  }
}

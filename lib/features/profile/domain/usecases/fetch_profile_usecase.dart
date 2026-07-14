import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../auth/domain/entity/user_entity.dart';
import '../repository/profile_repository.dart';

@lazySingleton
class FetchProfileUseCase implements UseCase<UserEntity, NoParams> {
  FetchProfileUseCase(this._repository);

  final ProfileRepository _repository;

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await _repository.fetchProfile();
  }
}

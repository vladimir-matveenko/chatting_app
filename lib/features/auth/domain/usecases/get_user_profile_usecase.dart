import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

@lazySingleton
class GetUserProfileUseCase implements UseCase<UserEntity?, NoParams> {
  GetUserProfileUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) async {
    return await repository.getUserProfile();
  }
}

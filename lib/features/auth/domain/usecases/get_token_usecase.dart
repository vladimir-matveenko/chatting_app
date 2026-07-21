import 'package:chatting_app/features/auth/domain/entity/auth_token_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/auth_repository.dart';

@lazySingleton
class GetTokenUseCase implements UseCase<AuthTokenEntity?, NoParams> {
  GetTokenUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthTokenEntity?>> call(NoParams params) async {
    return await _repository.getToken();
  }
}

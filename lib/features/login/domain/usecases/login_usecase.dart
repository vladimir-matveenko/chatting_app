import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../auth/domain/entity/auth_token_entity.dart';
import '../../../auth/domain/repository/auth_repository.dart';

@lazySingleton
class LoginUseCase implements UseCase<AuthTokenEntity, LoginParams> {
  LoginUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, AuthTokenEntity>> call(params) async {
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  LoginParams({required this.email, required this.password});

  final String email;
  final String password;
}

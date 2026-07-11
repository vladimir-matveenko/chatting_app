import 'package:chatting_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class CreateProfileUseCase implements UseCase<void, CreateProfileParams> {
  CreateProfileUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, void>> call(params) async {
    return await _repository.register(
      username: params.username,
      email: params.email,
      password: params.password,
    );
  }
}

class CreateProfileParams {
  CreateProfileParams({
    required this.username,
    required this.email,
    required this.password,
  });

  final String username;
  final String email;
  final String password;
}

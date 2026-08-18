import 'package:chatting_app/features/reset_password/domain/repository/reset_password_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';

@lazySingleton
class ResetPasswordUseCase implements UseCase<bool, ResetPasswordParams> {
  ResetPasswordUseCase(this._repository);

  final ResetPasswordRepository _repository;

  @override
  Future<Either<Failure, bool>> call(ResetPasswordParams params) async {
    return await _repository.resetPassword(
      resetToken: params.resetToken,
      password: params.password,
    );
  }
}

class ResetPasswordParams {
  ResetPasswordParams({required this.resetToken, required this.password});

  final String resetToken;
  final String password;
}

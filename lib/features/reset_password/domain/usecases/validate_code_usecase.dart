import 'package:chatting_app/features/reset_password/domain/repository/reset_password_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';

@lazySingleton
class ValidateCodeUseCase implements UseCase<String, ValidateCodeParams> {
  ValidateCodeUseCase(this._repository);

  final ResetPasswordRepository _repository;

  @override
  Future<Either<Failure, String>> call(ValidateCodeParams params) async {
    return await _repository.validateCode(
      email: params.email,
      code: params.code,
    );
  }
}

class ValidateCodeParams {
  ValidateCodeParams({required this.email, required this.code});

  final String email;
  final String code;
}

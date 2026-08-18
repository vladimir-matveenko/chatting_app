import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class ResetPasswordRepository {
  Future<Either<Failure, bool>> requestCode(String email);

  Future<Either<Failure, String>> validateCode({
    required String email,
    required String code,
  });

  Future<Either<Failure, bool>> resetPassword({
    required String resetToken,
    required String password,
  });
}

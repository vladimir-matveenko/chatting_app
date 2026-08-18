import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/mapper.dart';
import '../../domain/repository/reset_password_repository.dart';
import '../data_sources/reset_password_remote_data_source.dart';

@LazySingleton(as: ResetPasswordRepository)
class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  ResetPasswordRepositoryImpl({required this._dataSource});

  final ResetPasswordRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, bool>> requestCode(String email) async {
    try {
      final result = await _dataSource.requestCode(email);

      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword({
    required String resetToken,
    required String password,
  }) async {
    try {
      final result = await _dataSource.resetPassword(
        resetToken: resetToken,
        password: password,
      );

      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, String>> validateCode({
    required String email,
    required String code,
  }) async {
    try {
      final result = await _dataSource.validateCode(email: email, code: code);
      return Right(result ?? '');
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}

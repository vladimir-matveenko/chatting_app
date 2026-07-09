import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/domain/entity/user_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserEntity>> fetchProfile();

  Future<Either<Failure, bool>> updateProfile({required UserEntity profile});

  Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}

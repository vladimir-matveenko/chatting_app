import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/domain/entity/user_entity.dart';

abstract class ProfileRepository {
  UserEntity? get profile;

  Future<Either<Failure, UserEntity>> fetchProfile();

  Future<Either<Failure, bool>> updateProfile({
    String? username,
    String? displayName,
    String? email,
    String? avatarUrl,
  });

  Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<Failure, void>> clearCache();
}

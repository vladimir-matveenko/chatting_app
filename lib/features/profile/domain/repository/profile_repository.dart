import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, bool>> hasProfile();

  Future<Either<Failure, ProfileEntity>> fetchProfile();

  Future<Either<Failure, void>> saveProfile({required ProfileEntity profile});

  Future<Either<Failure, void>> deleteProfile();
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/mapper.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/repository/profile_repository.dart';
import '../data_sources/profile_local_data_source.dart';
import '../models/profile_model.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required this.profileLocalDataSource});

  final ProfileLocalDataSource profileLocalDataSource;
  ProfileEntity? profile;

  @override
  Future<Either<Failure, bool>> hasProfile() async {
    try {
      final model = await profileLocalDataSource.fetchProfile();
      if (model == null) {
        return const Right(false);
      }
      profile = model.toEntity();
      return const Right(true);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> fetchProfile() async {
    try {
      if (profile != null) {
        return Right(profile!);
      }
      final model = await profileLocalDataSource.fetchProfile();
      if (model == null) {
        return Left(CacheFailure());
      }
      return Right(model.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> saveProfile({
    required ProfileEntity profile,
  }) async {
    try {
      await profileLocalDataSource.saveProfile(profile.toModel());
      this.profile = profile;
      return const Right(null);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProfile() async {
    try {
      await profileLocalDataSource.deleteProfile();
      profile = null;
      return const Right(null);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}

import 'package:chatting_app/features/auth/domain/entity/user_entity.dart';
import 'package:chatting_app/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/entity/app_image_entity.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/mapper.dart';
import '../../../auth/data/models/user_model.dart';
import '../../domain/repository/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._profileRemoteDataSource);

  final ProfileRemoteDataSource _profileRemoteDataSource;
  UserEntity? _profile;

  @override
  UserEntity? get profile => _profile;

  @override
  Future<Either<Failure, UserEntity>> fetchProfile() async {
    try {
      final model = await _profileRemoteDataSource.fetchProfile();
      if (model == null) {
        return Left(CacheFailure());
      }
      _profile = model.toEntity();
      return Right(_profile!);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final result = await _profileRemoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      if (!result) {
        return Left(CacheFailure());
      }
      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> updateProfile({
    String? username,
    String? displayName,
    String? email,
  }) async {
    try {
      final result = await _profileRemoteDataSource.updateProfile(
        username: username,
        displayName: displayName,
        email: email,
      );
      if (!result) {
        return Left(CacheFailure());
      }
      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      _profile = null;
      return const Right(null);
    } on Exception catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUserAvatar(
    AppImageEntity imageFile,
  ) async {
    try {
      final result = await _profileRemoteDataSource.updateUserAvatar(imageFile);

      return Right(result!.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUserAvatar() async {
    try {
      final result = await _profileRemoteDataSource.deleteUserAvatar();

      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}

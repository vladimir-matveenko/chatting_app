import 'package:chatting_app/core/domain/entity/app_image_entity.dart';
import 'package:chatting_app/features/auth/domain/entity/user_entity.dart';
import 'package:chatting_app/features/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';

@lazySingleton
class UpdateAvatarUseCase implements UseCase<UserEntity, UpdateAvatarParams> {
  UpdateAvatarUseCase(this._repository);

  final ProfileRepository _repository;

  @override
  Future<Either<Failure, UserEntity>> call(params) async {
    return await _repository.updateUserAvatar(params.imageEntity);
  }
}

class UpdateAvatarParams {
  UpdateAvatarParams(this.imageEntity);

  final AppImageEntity imageEntity;
}

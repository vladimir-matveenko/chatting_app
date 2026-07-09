import 'package:chatting_app/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/profile_repository.dart';

@lazySingleton
class UpdateProfileUseCase implements UseCase<bool, UpdateProfileParams> {
  UpdateProfileUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<Either<Failure, bool>> call(UpdateProfileParams params) async {
    return await repository.updateProfile(profile: params.profile);
  }
}

class UpdateProfileParams {
  UpdateProfileParams({required this.profile});

  final UserEntity profile;
}

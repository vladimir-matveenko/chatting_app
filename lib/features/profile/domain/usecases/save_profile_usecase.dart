import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/profile_entity.dart';
import '../repository/profile_repository.dart';

@lazySingleton
class SaveProfileUseCase implements UseCase<void, ProfileParams> {
  SaveProfileUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.saveProfile(profile: params.profile);
  }
}

class ProfileParams {
  ProfileParams({required this.profile});

  final ProfileEntity profile;
}

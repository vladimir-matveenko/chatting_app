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
    return await repository.updateProfile(
      username: params.username,
      displayName: params.displayName,
      email: params.email,
      avatarUrl: params.avatarUrl,
    );
  }
}

class UpdateProfileParams {
  UpdateProfileParams({
    this.username,
    this.displayName,
    this.email,
    this.avatarUrl,
  });

  final String? username;
  final String? displayName;
  final String? email;
  final String? avatarUrl;
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/profile_repository.dart';

@lazySingleton
class UpdateProfileUseCase implements UseCase<bool, UpdateProfileParams> {
  UpdateProfileUseCase(this._repository);

  final ProfileRepository _repository;

  @override
  Future<Either<Failure, bool>> call(UpdateProfileParams params) async {
    return await _repository.updateProfile(
      username: params.username,
      displayName: params.displayName,
      email: params.email,
    );
  }
}

class UpdateProfileParams {
  UpdateProfileParams({this.username, this.displayName, this.email});

  final String? username;
  final String? displayName;
  final String? email;
}

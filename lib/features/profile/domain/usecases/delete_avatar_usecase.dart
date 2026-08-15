import 'package:chatting_app/features/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';

@lazySingleton
class DeleteAvatarUseCase implements UseCase<bool, NoParams> {
  DeleteAvatarUseCase(this._repository);

  final ProfileRepository _repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.deleteUserAvatar();
  }
}

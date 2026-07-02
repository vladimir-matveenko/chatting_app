import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/profile_entity.dart';
import '../repository/profile_repository.dart';

@lazySingleton
class FetchProfileUseCase implements UseCase<ProfileEntity, NoParams> {
  FetchProfileUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) async {
    return await repository.fetchProfile();
  }
}

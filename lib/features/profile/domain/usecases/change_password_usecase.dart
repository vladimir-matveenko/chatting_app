import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/profile_repository.dart';

@lazySingleton
class ChangePasswordUseCase implements UseCase<void, ChangePasswordParams> {
  ChangePasswordUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.changePassword(
      currentPassword: params.currentPassword,
      newPassword: params.newPassword,
    );
  }
}

class ChangePasswordParams {
  ChangePasswordParams({
    required this.currentPassword,
    required this.newPassword,
  });

  final String currentPassword;
  final String newPassword;
}

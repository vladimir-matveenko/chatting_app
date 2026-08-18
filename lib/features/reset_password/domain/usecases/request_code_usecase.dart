import 'package:chatting_app/features/reset_password/domain/repository/reset_password_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';

@lazySingleton
class RequestCodeUseCase implements UseCase<bool, RequestCodeParams> {
  RequestCodeUseCase(this._repository);

  final ResetPasswordRepository _repository;

  @override
  Future<Either<Failure, bool>> call(RequestCodeParams params) async {
    return await _repository.requestCode(params.email);
  }
}

class RequestCodeParams {
  RequestCodeParams(this.email);

  final String email;
}

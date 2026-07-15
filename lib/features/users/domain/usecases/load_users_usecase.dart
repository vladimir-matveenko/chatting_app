import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/users_list_item_entity.dart';
import '../repository/users_repository.dart';

@lazySingleton
class LoadUsersUseCase implements UseCase<List<UserListItemEntity>, NoParams> {
  LoadUsersUseCase(this._repository);

  final UsersRepository _repository;

  @override
  Future<Either<Failure, List<UserListItemEntity>>> call(
    NoParams params,
  ) async {
    return await _repository.loadUsers();
  }
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entity/users_list_item_entity.dart';
import '../repository/users_repository.dart';

@lazySingleton
class LoadUsersUseCase
    implements UseCase<List<UserListItemEntity>, LoadUsersParams> {
  LoadUsersUseCase(this._repository);

  final UsersRepository _repository;

  @override
  Future<Either<Failure, List<UserListItemEntity>>> call(
    LoadUsersParams params,
  ) async {
    return await _repository.loadUsers(
      query: params.query,
      limit: params.limit,
      offset: params.offset,
    );
  }
}

class LoadUsersParams {
  LoadUsersParams({this.query, this.limit, this.offset});

  final String? query;
  final int? limit;
  final int? offset;
}

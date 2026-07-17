import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/mapper.dart';
import '../../domain/entity/users_list_item_entity.dart';
import '../../domain/repository/users_repository.dart';
import '../data_sources/users_remote_data_source.dart';
import '../models/users_list_item_model.dart';

@LazySingleton(as: UsersRepository)
class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl(this._usersRemoteDataSource);

  final UsersRemoteDataSource _usersRemoteDataSource;

  @override
  Future<Either<Failure, List<UserListItemEntity>>> loadUsers() async {
    try {
      final list = await _usersRemoteDataSource.loadUsers();
      return Right(
        AppUtils.listModelToListEntity<UserListItemModel, UserListItemEntity>(
          list,
          (item) => item.toEntity(),
        ),
      );
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}

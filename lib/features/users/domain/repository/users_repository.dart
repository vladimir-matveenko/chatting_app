import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/users_list_item_entity.dart';

abstract class UsersRepository {
  Future<Either<Failure, List<UserListItemEntity>>> loadUsers();
}

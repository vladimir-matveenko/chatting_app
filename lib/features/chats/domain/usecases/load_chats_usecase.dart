import 'package:chatting_app/features/chats/domain/repository/chats_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../auth/domain/entity/user_entity.dart';

@lazySingleton
class LoadChatsUseCase implements UseCase<UserEntity, NoParams> {
  LoadChatsUseCase(this._repository);

  final ChatsRepository _repository;

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await _repository.loadChats();
  }
}

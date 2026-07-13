import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:chatting_app/features/chats/domain/repository/chats_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class LoadChatsUseCase implements UseCase<List<ChatListItemEntity>, NoParams> {
  LoadChatsUseCase(this._repository);

  final ChatsRepository _repository;

  @override
  Future<Either<Failure, List<ChatListItemEntity>>> call(
    NoParams params,
  ) async {
    return await _repository.loadChats();
  }
}

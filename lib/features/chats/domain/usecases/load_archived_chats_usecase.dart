import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:chatting_app/features/chats/domain/repository/chats_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class LoadArchivedChatsUseCase
    implements UseCase<List<ChatListItemEntity>, LoadArchivedChatsParams> {
  LoadArchivedChatsUseCase(this._repository);

  final ChatsRepository _repository;

  @override
  Future<Either<Failure, List<ChatListItemEntity>>> call(
    LoadArchivedChatsParams params,
  ) async {
    return await _repository.loadArchivedChats(
      query: params.query,
      limit: params.limit,
      offset: params.offset,
    );
  }
}

class LoadArchivedChatsParams {
  LoadArchivedChatsParams({this.query, this.limit, this.offset});

  final String? query;
  final int? limit;
  final int? offset;
}

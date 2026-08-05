import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class ChatsRepository {
  Future<Either<Failure, List<ChatListItemEntity>>> loadChats({
    String? query,
    int? limit,
    int? offset,
  });

  Future<Either<Failure, List<ChatListItemEntity>>> loadArchivedChats({
    String? query,
    int? limit,
    int? offset,
  });

  Future<Either<Failure, bool>> archive(String chatId);

  Future<Either<Failure, bool>> returnFromArchive(String chatId);
}

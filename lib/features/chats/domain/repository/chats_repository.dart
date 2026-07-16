import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class ChatsRepository {
  Future<Either<Failure, List<ChatListItemEntity>>> loadChats();
}

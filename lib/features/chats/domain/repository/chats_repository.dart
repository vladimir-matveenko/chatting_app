import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:chatting_app/features/chats/domain/entity/chat_member_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/error/failure.dart';
import '../entity/chat_entity.dart';

abstract class ChatsRepository {
  Future<Either<Failure, List<ChatListItemEntity>>> loadChats();

  Future<Either<Failure, ChatEntity>> createChat({
    required ChatType type,
    String? title,
    String? avatarUrl,
    required List<String> memberIds,
  });

  Future<Either<Failure, ChatEntity>> getChatById(String chatId);

  Future<Either<Failure, List<ChatMemberEntity>>> getChatMembers({
    required String chatId,
  });
}

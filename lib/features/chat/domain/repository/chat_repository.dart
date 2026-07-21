import 'package:dartz/dartz.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/error/failure.dart';
import '../entity/chat_entity.dart';
import '../entity/chat_member_entity.dart';

abstract class ChatRepository {
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

  Future<Either<Failure, bool>> deleteChatMember({
    required String chatId,
    required String userId,
  });

  Future<Either<Failure, ChatMemberEntity>> addChatMember(String chatId);
}

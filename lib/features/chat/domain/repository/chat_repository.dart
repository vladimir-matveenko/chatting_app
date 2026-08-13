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

  Future<Either<Failure, ChatEntity>> updateChat({
    required String chatId,
    String? title,
    String? avatarUrl,
  });

  Future<Either<Failure, List<ChatMemberEntity>>> getChatMembers({
    required String chatId,
  });

  Future<Either<Failure, bool>> deleteChatMember({
    required String chatId,
    required String userId,
  });

  Future<Either<Failure, bool>> addChatMember({
    required String chatId,
    required List<String> memberIds,
  });

  Future<Either<Failure, bool>> muteChat({
    required String chatId,
    required bool isMuted,
  });

  Future<Either<Failure, bool>> leaveChat(String chatId);

  Future<Either<Failure, bool>> changeOwner({
    required String chatId,
    required String userId,
  });

  Future<Either<Failure, bool>> changeMemberRole({
    required String chatId,
    required String userId,
    required ChatMemberRole role,
  });

  Future<Either<Failure, ChatMemberEntity>> getChatMember({
    required String chatId,
    required String userId,
  });

  Future<Either<Failure, ChatMemberEntity>> getMeFromChat(String chatId);
}

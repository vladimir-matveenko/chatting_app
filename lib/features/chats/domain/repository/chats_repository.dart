import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/domain/entity/user_entity.dart';
import '../../data/chats_enums.dart';

abstract class ChatsRepository {
  Future<Either<Failure, UserEntity>> loadChats();

  Future<Either<Failure, UserEntity>> createChat({
    required ChatType type,
    String? title,
    String? avatarUrl,
    required List<String> memberIds,
  });

  Future<Either<Failure, UserEntity>> getChatById(String chatId);

  Future<Either<Failure, UserEntity>> getChatMembers({required String chatId});
}

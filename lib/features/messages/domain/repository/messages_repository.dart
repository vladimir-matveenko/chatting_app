import 'package:dartz/dartz.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/error/failure.dart';
import '../entity/message_entity.dart';

abstract class MessagesRepository {
  Future<Either<Failure, List<MessageEntity>>> loadMessages(String chatId);

  Future<Either<Failure, MessageEntity>> sendMessage({
    required String chatId,
    String? replyToId,
    required MessageType type,
    String? body,
  });

  Future<Either<Failure, MessageEntity>> getMessageById(String messageId);

  Future<Either<Failure, bool>> deleteMessage(String messageId);

  Future<Either<Failure, bool>> addReaction(
    String messageId, {
    required ReactionType type,
  });

  Future<Either<Failure, bool>> deleteReaction(String messageId);
}

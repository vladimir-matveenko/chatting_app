import 'package:dartz/dartz.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/error/failure.dart';
import '../entity/message_entity.dart';
import '../entity/message_page_entity.dart';
import '../entity/message_search_result_entity.dart';

abstract class MessagesRepository {
  Future<Either<Failure, MessagesPageEntity>> loadMessages({
    required String chatId,
    int? before,
    int? after,
    String? aroundMessageId,
    String? beforeMessageId,
    String? afterMessageId,
  });

  Future<Either<Failure, List<MessageSearchResultEntity>>> searchMessages({
    required String chatId,
    required String query,
  });

  Future<Either<Failure, MessageEntity>> sendMessage({
    required String chatId,
    String? replyToId,
    required MessageType type,
    String? body,
  });

  Future<Either<Failure, MessageEntity>> getMessageById(String messageId);

  Future<Either<Failure, MessageEntity>> updateMessage({
    required String messageId,
    required String body,
  });

  Future<Either<Failure, bool>> deleteMessage(String messageId);

  Future<Either<Failure, bool>> addReaction(
    String messageId, {
    required ReactionType type,
  });

  Future<Either<Failure, bool>> deleteReaction(String messageId);

  Future<Either<Failure, MessageEntity>> pinMessage(String messageId);

  Future<Either<Failure, MessageEntity>> unPinMessage(String messageId);

  Future<Either<Failure, List<MessageEntity>>> getPinnedMessages({
    required String chatId,
  });
}

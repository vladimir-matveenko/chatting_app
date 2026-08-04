import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/features/messages/data/models/message_model.dart';
import 'package:chatting_app/features/messages/data/models/message_page_model.dart';
import 'package:chatting_app/features/messages/data/models/message_search_result_model.dart';
import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:chatting_app/features/messages/domain/entity/message_search_result_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/mapper.dart';
import '../../domain/entity/message_page_entity.dart';
import '../../domain/repository/messages_repository.dart';
import '../data_sources/messages_remote_data_source.dart';

@LazySingleton(as: MessagesRepository)
class MessagesRepositoryImpl implements MessagesRepository {
  MessagesRepositoryImpl(this._messagesRemoteDataSource);

  final MessagesRemoteDataSource _messagesRemoteDataSource;

  @override
  Future<Either<Failure, MessagesPageEntity>> loadMessages({
    required String chatId,
    int? before,
    int? after,
    String? aroundMessageId,
    String? beforeMessageId,
    String? afterMessageId,
  }) async {
    try {
      final result = await _messagesRemoteDataSource.loadMessages(
        chatId: chatId,
        before: before,
        after: after,
        aroundMessageId: aroundMessageId,
        beforeMessageId: beforeMessageId,
        afterMessageId: afterMessageId,
      );
      return Right(result.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<MessageSearchResultEntity>>> searchMessages({
    required String chatId,
    required String query,
  }) async {
    try {
      final list = await _messagesRemoteDataSource.searchMessages(
        chatId: chatId,
        query: query,
      );
      return Right(
        AppUtils.listModelToListEntity<
          MessageSearchResultModel,
          MessageSearchResultEntity
        >(list, (item) => item.toEntity()),
      );
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> sendMessage({
    required String chatId,
    String? replyToId,
    required MessageType type,
    String? body,
  }) async {
    try {
      final item = await _messagesRemoteDataSource.sendMessage(
        chatId: chatId,
        replyToId: replyToId,
        body: body,
        type: type,
      );
      return Right(item!.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> getMessageById(
    String messageId,
  ) async {
    try {
      final item = await _messagesRemoteDataSource.getMessageById(messageId);
      return Right(item!.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> updateMessage({
    required String messageId,
    required String body,
  }) async {
    try {
      final item = await _messagesRemoteDataSource.updateMessage(
        messageId: messageId,
        body: body,
      );
      return Right(item!.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteMessage(String messageId) async {
    try {
      final item = await _messagesRemoteDataSource.deleteMessage(messageId);
      return Right(item);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> addReaction(
    String messageId, {
    required ReactionType type,
  }) async {
    try {
      final item = await _messagesRemoteDataSource.addReaction(
        messageId,
        type: type,
      );
      return Right(item);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteReaction(String messageId) async {
    try {
      final item = await _messagesRemoteDataSource.deleteReaction(messageId);
      return Right(item);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> getPinnedMessages({
    required String chatId,
  }) async {
    try {
      final list = await _messagesRemoteDataSource.getPinnedMessages(
        chatId: chatId,
      );
      return Right(
        AppUtils.listModelToListEntity<MessageModel, MessageEntity>(
          list,
          (item) => item.toEntity(),
        ),
      );
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> pinMessage(String messageId) async {
    try {
      final item = await _messagesRemoteDataSource.pinMessage(messageId);
      return Right(item!.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> unPinMessage(String messageId) async {
    try {
      final item = await _messagesRemoteDataSource.unPinMessage(messageId);
      return Right(item!.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}

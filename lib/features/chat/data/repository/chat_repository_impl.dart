import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/mapper.dart';
import '../../domain/entity/chat_entity.dart';
import '../../domain/entity/chat_member_entity.dart';
import '../../domain/repository/chat_repository.dart';
import '../data_sources/chat_remote_data_source.dart';
import '../models/chat_member_model.dart';
import '../models/chat_model.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(this._chatsRemoteDataSource);

  final ChatRemoteDataSource _chatsRemoteDataSource;

  @override
  Future<Either<Failure, ChatEntity>> createChat({
    required ChatType type,
    String? title,
    String? avatarUrl,
    required List<String> memberIds,
  }) async {
    try {
      final chat = await _chatsRemoteDataSource.createChat(
        type: type,
        title: title,
        avatarUrl: avatarUrl,
        memberIds: memberIds,
      );
      return Right(chat!.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, ChatEntity>> getChatById(String chatId) async {
    try {
      final chat = await _chatsRemoteDataSource.getChatById(chatId);
      return Right(chat!.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, ChatEntity>> updateChat({
    required String chatId,
    String? title,
    String? avatarUrl,
  }) async {
    try {
      final chat = await _chatsRemoteDataSource.updateChat(
        chatId: chatId,
        title: title,
        avatarUrl: avatarUrl,
      );
      return Right(chat!.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<ChatMemberEntity>>> getChatMembers({
    required String chatId,
  }) async {
    try {
      final list = await _chatsRemoteDataSource.getChatMembers(chatId: chatId);

      return Right(
        AppUtils.listModelToListEntity<ChatMemberModel, ChatMemberEntity>(
          list,
          (item) => item.toEntity(),
        ),
      );
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteChatMember({
    required String chatId,
    required String userId,
  }) async {
    try {
      final result = await _chatsRemoteDataSource.deleteChatMember(
        chatId: chatId,
        userId: userId,
      );

      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> addChatMember({
    required String chatId,
    required List<String> memberIds,
  }) async {
    try {
      final result = await _chatsRemoteDataSource.addChatMember(
        chatId: chatId,
        memberIds: memberIds,
      );

      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}

import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/features/chats/data/data_sources/chats_remote_data_source.dart';
import 'package:chatting_app/features/chats/data/models/chat_list_item_model.dart';
import 'package:chatting_app/features/chats/data/models/chat_member_model.dart';
import 'package:chatting_app/features/chats/domain/entity/chat_entity.dart';
import 'package:chatting_app/features/chats/domain/entity/chat_member_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/mapper.dart';
import '../../domain/entity/chat_list_item_entity.dart';
import '../../domain/repository/chats_repository.dart';
import '../models/chat_model.dart';

@LazySingleton(as: ChatsRepository)
class ChatsRepositoryImpl implements ChatsRepository {
  ChatsRepositoryImpl(this._chatsRemoteDataSource);

  final ChatsRemoteDataSource _chatsRemoteDataSource;

  @override
  Future<Either<Failure, List<ChatListItemEntity>>> loadChats() async {
    try {
      final list = await _chatsRemoteDataSource.loadChats();
      return Right(
        AppUtils.listModelToListEntity<ChatListItemModel, ChatListItemEntity>(
          list,
          (item) => item.toEntity(),
        ),
      );
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

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
}

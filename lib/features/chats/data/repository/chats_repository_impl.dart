import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/features/chats/data/data_sources/chats_remote_data_source.dart';
import 'package:chatting_app/features/chats/data/models/chat_list_item_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/mapper.dart';
import '../../domain/entity/chat_list_item_entity.dart';
import '../../domain/repository/chats_repository.dart';

@LazySingleton(as: ChatsRepository)
class ChatsRepositoryImpl implements ChatsRepository {
  ChatsRepositoryImpl(this._chatsRemoteDataSource);

  final ChatsRemoteDataSource _chatsRemoteDataSource;

  @override
  Future<Either<Failure, List<ChatListItemEntity>>> loadChats({
    String? query,
    int? limit,
    int? offset,
  }) async {
    try {
      final list = await _chatsRemoteDataSource.loadChats(
        query: query,
        limit: limit,
        offset: offset,
      );
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
  Future<Either<Failure, List<ChatListItemEntity>>> loadArchivedChats({
    String? query,
    int? limit,
    int? offset,
  }) async {
    try {
      final list = await _chatsRemoteDataSource.loadArchivedChats(
        query: query,
        limit: limit,
        offset: offset,
      );
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
  Future<Either<Failure, bool>> archive(String chatId) async {
    try {
      final result = await _chatsRemoteDataSource.archive(chatId);

      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> returnFromArchive(String chatId) async {
    try {
      final result = await _chatsRemoteDataSource.returnFromArchive(chatId);

      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}

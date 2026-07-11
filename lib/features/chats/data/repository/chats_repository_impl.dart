import 'package:chatting_app/features/auth/data/models/user_model.dart';
import 'package:chatting_app/features/auth/domain/entity/user_entity.dart';
import 'package:chatting_app/features/chats/data/data_sources/chats_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/mapper.dart';
import '../../domain/repository/chats_repository.dart';
import '../chats_enums.dart';

@LazySingleton(as: ChatsRepository)
class ChatsRepositoryImpl implements ChatsRepository {
  ChatsRepositoryImpl(this._chatsRemoteDataSource);

  final ChatsRemoteDataSource _chatsRemoteDataSource;
  UserEntity? profile;

  @override
  Future<Either<Failure, UserEntity>> loadChats() async {
    try {
      if (profile != null) {
        return Right(profile!);
      }
      final model = await _chatsRemoteDataSource.loadChats();
      if (model == null) {
        return Left(CacheFailure());
      }
      return Right(model.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> createChat({
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
  Future<Either<Failure, UserEntity>> getChatById(String chatId) async {
    try {
      final chat = await _chatsRemoteDataSource.getChatById(chatId);
      return Right(chat!.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getChatMembers({
    required String chatId,
  }) async {
    try {
      final result = await _chatsRemoteDataSource.getChatMembers(
        chatId: chatId,
      );

      return Right(result!.toEntity());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}

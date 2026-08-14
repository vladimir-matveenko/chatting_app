import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entity/chat_member_entity.dart';
import '../repository/chat_repository.dart';

@lazySingleton
class GetChatMembersUseCase
    implements UseCase<List<ChatMemberEntity>, GetChatMembersParams> {
  GetChatMembersUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Either<Failure, List<ChatMemberEntity>>> call(
    GetChatMembersParams params,
  ) async {
    return await _repository.getChatMembers(
      chatId: params.chatId,
      query: params.query,
      limit: params.limit,
      offset: params.offset,
    );
  }
}

class GetChatMembersParams {
  GetChatMembersParams({
    required this.chatId,
    this.query,
    this.limit,
    this.offset,
  });

  final String chatId;
  final String? query;
  final int? limit;
  final int? offset;
}

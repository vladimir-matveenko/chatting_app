import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
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
    return await _repository.getChatMembers(chatId: params.chatId);
  }
}

class GetChatMembersParams {
  GetChatMembersParams({required this.chatId});

  final String chatId;
}

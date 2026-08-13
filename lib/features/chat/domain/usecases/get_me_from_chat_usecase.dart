import 'package:chatting_app/features/chat/domain/entity/chat_member_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/chat_repository.dart';

@lazySingleton
class GetMeFromChatUseCase
    implements UseCase<ChatMemberEntity, GetMeFromChatParams> {
  GetMeFromChatUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Either<Failure, ChatMemberEntity>> call(params) async {
    return await _repository.getMeFromChat(params.chatId);
  }
}

class GetMeFromChatParams {
  GetMeFromChatParams(this.chatId);

  final String chatId;
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entity/chat_entity.dart';
import '../repository/chat_repository.dart';

@lazySingleton
class GetChatUseCase implements UseCase<ChatEntity, GetChatParams> {
  GetChatUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Either<Failure, ChatEntity>> call(params) async {
    return await _repository.getChatById(params.chatId);
  }
}

class GetChatParams {
  GetChatParams(this.chatId);

  final String chatId;
}

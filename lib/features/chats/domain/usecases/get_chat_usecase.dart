import 'package:chatting_app/features/chats/domain/repository/chats_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class GetChatUseCase implements UseCase<void, GetChatParams> {
  GetChatUseCase(this._repository);

  final ChatsRepository _repository;

  @override
  Future<Either<Failure, void>> call(params) async {
    return await _repository.getChatById(params.chatId);
  }
}

class GetChatParams {
  GetChatParams(this.chatId);

  final String chatId;
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/chat_repository.dart';

@lazySingleton
class LeaveChatUseCase implements UseCase<bool, LeaveChatParams> {
  LeaveChatUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.leaveChat(params.chatId);
  }
}

class LeaveChatParams {
  LeaveChatParams(this.chatId);

  final String chatId;
}

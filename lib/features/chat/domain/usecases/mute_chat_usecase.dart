import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/chat_repository.dart';

@lazySingleton
class MuteChatUseCase implements UseCase<bool, MuteChatParams> {
  MuteChatUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.muteChat(
      chatId: params.chatId,
      isMuted: params.isMuted,
    );
  }
}

class MuteChatParams {
  MuteChatParams({required this.chatId, required this.isMuted});

  final String chatId;
  final bool isMuted;
}

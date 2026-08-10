import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/chats_repository.dart';

@lazySingleton
class ArchiveChatUseCase implements UseCase<bool, ArchiveChatParams> {
  ArchiveChatUseCase(this._repository);

  final ChatsRepository _repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.archive(params.chatId);
  }
}

class ArchiveChatParams {
  ArchiveChatParams(this.chatId);

  final String chatId;
}

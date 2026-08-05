import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/chats_repository.dart';

@lazySingleton
class ReturnFromArchiveUseCase
    implements UseCase<bool, ReturnFromArchiveParams> {
  ReturnFromArchiveUseCase(this._repository);

  final ChatsRepository _repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.returnFromArchive(params.chatId);
  }
}

class ReturnFromArchiveParams {
  ReturnFromArchiveParams(this.chatId);

  final String chatId;
}

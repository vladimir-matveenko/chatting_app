import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/chat_repository.dart';

@lazySingleton
class ChangeOwnerUseCase implements UseCase<bool, ChangeOwnerParams> {
  ChangeOwnerUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.changeOwner(
      chatId: params.chatId,
      userId: params.userId,
    );
  }
}

class ChangeOwnerParams {
  ChangeOwnerParams({required this.chatId, required this.userId});

  final String chatId;
  final String userId;
}

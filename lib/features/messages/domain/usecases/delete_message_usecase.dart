import 'package:chatting_app/features/messages/domain/repository/messages_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class DeleteMessageUseCase implements UseCase<bool, DeleteMessageParams> {
  DeleteMessageUseCase(this._repository);

  final MessagesRepository _repository;

  @override
  Future<Either<Failure, bool>> call(DeleteMessageParams params) async {
    return await _repository.deleteMessage(params.messageId);
  }
}

class DeleteMessageParams {
  DeleteMessageParams({required this.messageId});

  final String messageId;
}

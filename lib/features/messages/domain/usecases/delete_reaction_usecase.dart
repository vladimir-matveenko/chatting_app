import 'package:chatting_app/features/messages/domain/repository/messages_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class DeleteReactionUseCase implements UseCase<bool, DeleteReactionParams> {
  DeleteReactionUseCase(this._repository);

  final MessagesRepository _repository;

  @override
  Future<Either<Failure, bool>> call(DeleteReactionParams params) async {
    return await _repository.deleteReaction(params.messageId);
  }
}

class DeleteReactionParams {
  DeleteReactionParams({required this.messageId});

  final String messageId;
}

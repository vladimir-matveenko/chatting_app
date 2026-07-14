import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/features/messages/domain/repository/messages_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class AddReactionUseCase implements UseCase<bool, AddReactionParams> {
  AddReactionUseCase(this._repository);

  final MessagesRepository _repository;

  @override
  Future<Either<Failure, bool>> call(AddReactionParams params) async {
    return await _repository.addReaction(params.messageId, type: params.type);
  }
}

class AddReactionParams {
  AddReactionParams({required this.messageId, required this.type});

  final String messageId;
  final ReactionType type;
}

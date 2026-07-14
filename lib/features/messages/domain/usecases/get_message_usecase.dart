import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/messages_repository.dart';

@lazySingleton
class GetMessageUseCase implements UseCase<MessageEntity, GetMessageParams> {
  GetMessageUseCase(this._repository);

  final MessagesRepository _repository;

  @override
  Future<Either<Failure, MessageEntity>> call(params) async {
    return await _repository.getMessageById(params.messageId);
  }
}

class GetMessageParams {
  GetMessageParams(this.messageId);

  final String messageId;
}

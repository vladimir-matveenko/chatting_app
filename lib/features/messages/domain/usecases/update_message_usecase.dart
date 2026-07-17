import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/messages_repository.dart';

@lazySingleton
class UpdateMessageUseCase
    implements UseCase<MessageEntity, UpdateMessageParams> {
  UpdateMessageUseCase(this._repository);

  final MessagesRepository _repository;

  @override
  Future<Either<Failure, MessageEntity>> call(params) async {
    return await _repository.updateMessage(
      messageId: params.messageId,
      body: params.body,
    );
  }
}

class UpdateMessageParams {
  UpdateMessageParams({required this.messageId, required this.body});

  final String messageId;
  final String body;
}

import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/messages_repository.dart';

@lazySingleton
class LoadMessagesUseCase
    implements UseCase<List<MessageEntity>, LoadMessagesParams> {
  LoadMessagesUseCase(this._repository);

  final MessagesRepository _repository;

  @override
  Future<Either<Failure, List<MessageEntity>>> call(params) async {
    return await _repository.loadMessages(params.chatId);
  }
}

class LoadMessagesParams {
  LoadMessagesParams({required this.chatId});

  final String chatId;
}

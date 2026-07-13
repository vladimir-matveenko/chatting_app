import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:chatting_app/features/messages/domain/repository/messages_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class SendMessageUseCase implements UseCase<MessageEntity, SendMessageParams> {
  SendMessageUseCase(this._repository);

  final MessagesRepository _repository;

  @override
  Future<Either<Failure, MessageEntity>> call(params) async {
    return await _repository.sendMessage(
      chatId: params.chatId,
      replyToId: params.replyToId,
      type: params.type,
      body: params.body,
    );
  }
}

class SendMessageParams {
  SendMessageParams({
    required this.chatId,
    this.replyToId,
    required this.type,
    this.body,
  });

  final String chatId;
  final String? replyToId;
  final MessageType type;
  final String? body;
}

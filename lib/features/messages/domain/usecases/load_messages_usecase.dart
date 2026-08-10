import 'package:chatting_app/features/messages/domain/entity/message_page_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/messages_repository.dart';

@lazySingleton
class LoadMessagesUseCase
    implements UseCase<MessagesPageEntity, LoadMessagesParams> {
  LoadMessagesUseCase(this._repository);

  final MessagesRepository _repository;

  @override
  Future<Either<Failure, MessagesPageEntity>> call(params) async {
    return await _repository.loadMessages(
      chatId: params.chatId,
      beforeMessageId: params.beforeMessageId,
      afterMessageId: params.afterMessageId,
    );
  }
}

class LoadMessagesParams {
  LoadMessagesParams({
    required this.chatId,
    this.beforeMessageId,
    this.afterMessageId,
  });

  final String chatId;

  /// Message ID for getting older messages
  final String? beforeMessageId;

  /// Message ID for getting newer messages
  final String? afterMessageId;
}

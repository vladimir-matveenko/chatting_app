import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/message_page_entity.dart';
import '../repository/messages_repository.dart';

@lazySingleton
class GetAroundContextUseCase
    implements UseCase<MessagesPageEntity, GetAroundContextParams> {
  GetAroundContextUseCase(this._repository);

  final MessagesRepository _repository;

  @override
  Future<Either<Failure, MessagesPageEntity>> call(params) async {
    return await _repository.loadMessages(
      chatId: params.chatId,
      aroundMessageId: params.aroundMessageId,
    );
  }
}

class GetAroundContextParams {
  GetAroundContextParams({
    required this.chatId,
    this.before,
    this.after,
    required this.aroundMessageId,
  });

  final String chatId;

  /// Number of messages before aroundMessageId. Default = 10
  final int? before;

  /// Number of messages after aroundMessageId. Default = 10
  final int? after;

  /// Message ID for getting around context
  final String aroundMessageId;
}

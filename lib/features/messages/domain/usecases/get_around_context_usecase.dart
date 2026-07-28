import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/around_context_entity.dart';
import '../repository/messages_repository.dart';

@lazySingleton
class GetAroundContextUseCase
    implements UseCase<AroundContextEntity, GetAroundContextParams> {
  GetAroundContextUseCase(this._repository);

  final MessagesRepository _repository;

  @override
  Future<Either<Failure, AroundContextEntity>> call(params) async {
    return await _repository.getAroundContext(
      chatId: params.chatId,
      messageId: params.messageId,
      before: params.before,
      after: params.after,
    );
  }
}

class GetAroundContextParams {
  GetAroundContextParams({
    required this.chatId,
    required this.messageId,
    this.before,
    this.after,
  });

  final String chatId;
  final String messageId;
  final int? before;
  final int? after;
}

import 'package:chatting_app/features/messages/domain/entity/message_search_result_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/messages_repository.dart';

@lazySingleton
class SearchMessagesUseCase
    implements UseCase<List<MessageSearchResultEntity>, SearchMessagesParams> {
  SearchMessagesUseCase(this._repository);

  final MessagesRepository _repository;

  @override
  Future<Either<Failure, List<MessageSearchResultEntity>>> call(params) async {
    return await _repository.searchMessages(
      chatId: params.chatId,
      query: params.query,
    );
  }
}

class SearchMessagesParams {
  SearchMessagesParams({required this.chatId, required this.query});

  final String chatId;
  final String query;
}

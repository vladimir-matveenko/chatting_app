import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/chat_entity.dart';
import '../repository/chat_repository.dart';

@lazySingleton
class UpdateChatUseCase implements UseCase<ChatEntity, UpdateChatParams> {
  UpdateChatUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Either<Failure, ChatEntity>> call(params) async {
    return await _repository.updateChat(
      chatId: params.chatId,
      title: params.title,
      avatarUrl: params.avatarUrl,
    );
  }
}

class UpdateChatParams {
  UpdateChatParams({required this.chatId, this.title, this.avatarUrl});

  final String chatId;
  final String? title;
  final String? avatarUrl;
}

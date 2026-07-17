import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/chat_entity.dart';
import '../repository/chat_repository.dart';

@lazySingleton
class CreateChatUseCase implements UseCase<ChatEntity, CreateChatParams> {
  CreateChatUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Either<Failure, ChatEntity>> call(params) async {
    return await _repository.createChat(
      type: params.type,
      title: params.title,
      avatarUrl: params.avatarUrl,
      memberIds: params.memberIds,
    );
  }
}

class CreateChatParams {
  CreateChatParams({
    required this.type,
    this.title,
    this.avatarUrl,
    required this.memberIds,
  });

  final ChatType type;
  final String? title;
  final String? avatarUrl;
  final List<String> memberIds;
}

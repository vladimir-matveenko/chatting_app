import 'package:chatting_app/features/chat/domain/entity/chat_member_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/chat_repository.dart';

@lazySingleton
class AddMemberUseCase implements UseCase<ChatMemberEntity, AddMemberParams> {
  AddMemberUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Either<Failure, ChatMemberEntity>> call(params) async {
    return await _repository.addChatMember(params.chatId);
  }
}

class AddMemberParams {
  AddMemberParams(this.chatId);

  final String chatId;
}

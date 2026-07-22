import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/chat_repository.dart';

@lazySingleton
class AddMemberUseCase implements UseCase<bool, AddMemberParams> {
  AddMemberUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.addChatMember(
      chatId: params.chatId,
      memberIds: params.memberIds,
    );
  }
}

class AddMemberParams {
  AddMemberParams({required this.chatId, required this.memberIds});

  final String chatId;
  final List<String> memberIds;
}

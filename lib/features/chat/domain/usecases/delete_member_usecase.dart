import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/chat_repository.dart';

@lazySingleton
class DeleteMemberUseCase implements UseCase<bool, DeleteMemberParams> {
  DeleteMemberUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.deleteChatMember(
      chatId: params.chatId,
      userId: params.userId,
    );
  }
}

class DeleteMemberParams {
  DeleteMemberParams({required this.chatId, required this.userId});

  final String chatId;
  final String userId;
}

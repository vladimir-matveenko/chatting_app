import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/chat_repository.dart';

@lazySingleton
class ChangeMemberRoleUseCase implements UseCase<bool, ChangeMemberRoleParams> {
  ChangeMemberRoleUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.changeMemberRole(
      chatId: params.chatId,
      userId: params.userId,
      role: params.role,
    );
  }
}

class ChangeMemberRoleParams {
  ChangeMemberRoleParams({
    required this.chatId,
    required this.userId,
    required this.role,
  });

  final String chatId;
  final String userId;
  final ChatMemberRole role;
}

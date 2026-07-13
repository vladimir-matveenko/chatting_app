import 'package:chatting_app/features/chats/domain/usecases/get_chat_members_usecase.dart';
import 'package:chatting_app/features/chats/presentation/chat_cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/utils/app_utils.dart';
import '../../domain/usecases/get_chat_usecase.dart';

@lazySingleton
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._getChatUseCase, this._getChatMembersUseCase)
    : super(const ChatState());
  final GetChatUseCase _getChatUseCase;
  final GetChatMembersUseCase _getChatMembersUseCase;

  Future<void> getChatById(String chatId) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getChatUseCase(GetChatParams(chatId));
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(isLoading: false, chat: r));
      },
    );
  }

  Future<void> getChatMembers({required String chatId}) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getChatMembersUseCase(
      GetChatMembersParams(chatId: chatId),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(isLoading: false));
      },
    );
  }

  Future<void> disableError() async {
    emit(state.copyWith(error: ''));
  }
}

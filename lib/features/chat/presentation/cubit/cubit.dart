import 'package:chatting_app/features/chat/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../app/utils/app_utils.dart';
import '../../domain/usecases/create_chat_usecase.dart';
import '../../domain/usecases/get_chat_members_usecase.dart';
import '../../domain/usecases/get_chat_usecase.dart';

@lazySingleton
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
    this._getChatUseCase,
    this._getChatMembersUseCase,
    this._createChatUseCase,
  ) : super(const ChatState());
  final GetChatUseCase _getChatUseCase;
  final GetChatMembersUseCase _getChatMembersUseCase;
  final CreateChatUseCase _createChatUseCase;

  Future<void> createChat({
    required ChatType type,
    String? title,
    String? avatarUrl,
    required List<String> memberIds,
    bool shouldNavigate = false,
  }) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createChatUseCase(
      CreateChatParams(
        type: type,
        title: title,
        avatarUrl: avatarUrl,
        memberIds: memberIds,
      ),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            shouldNavigate: false,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            isLoading: false,
            chat: r,
            shouldNavigate: shouldNavigate,
          ),
        );
      },
    );
  }

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

  Future<void> disableNavigate() async {
    emit(state.copyWith(shouldNavigate: false));
  }
}

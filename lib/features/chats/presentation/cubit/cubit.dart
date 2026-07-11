import 'package:chatting_app/features/chats/domain/usecases/load_chats_usecase.dart';
import 'package:chatting_app/features/chats/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/chats_enums.dart';
import '../../domain/usecases/create_chat_usecase.dart';
import '../../domain/usecases/get_chat_usecase.dart';

@lazySingleton
class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit(
    this._loadChatsUseCase,
    this._createChatUseCase,
    this._getChatUseCase,
  ) : super(const ChatsState());
  final LoadChatsUseCase _loadChatsUseCase;
  final CreateChatUseCase _createChatUseCase;
  final GetChatUseCase _getChatUseCase;

  Future<void> loadChats({bool loadSilent = false}) async {
    if (!loadSilent) {
      emit(state.copyWith(isLoading: true));
    }
    final profile = await _loadChatsUseCase(NoParams());
    profile.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(profile: r, isLoading: false));
      },
    );
  }

  Future<void> createChat({
    required ChatType type,
    String? title,
    String? avatarUrl,
    required List<String> memberIds,
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
          ),
        );
      },
      (r) {
        emit(state.copyWith(isLoading: false, createdSuccessful: true));
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
        emit(state.copyWith(isLoading: false, createdSuccessful: true));
      },
    );
  }

  Future<void> getChatMembers({required String chatId}) async {
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
        emit(state.copyWith(isLoading: false, createdSuccessful: true));
      },
    );
  }

  Future<void> disableError() async {
    emit(state.copyWith(error: ''));
  }
}

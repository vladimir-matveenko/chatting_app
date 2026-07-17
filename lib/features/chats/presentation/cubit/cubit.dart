import 'package:chatting_app/features/chats/domain/usecases/load_chats_usecase.dart';
import 'package:chatting_app/features/chats/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit(this._loadChatsUseCase) : super(const ChatsState());
  final LoadChatsUseCase _loadChatsUseCase;

  Future<void> loadChats({bool loadSilent = true}) async {
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
        emit(state.copyWith(chats: r, isLoading: false));
      },
    );
  }

  Future<void> disableError() async {
    emit(state.copyWith(error: ''));
  }
}

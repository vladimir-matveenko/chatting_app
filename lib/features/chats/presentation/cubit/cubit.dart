import 'dart:async';

import 'package:chatting_app/features/chats/domain/usecases/load_chats_usecase.dart';
import 'package:chatting_app/features/chats/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/socket/chats_socket_service.dart';

@lazySingleton
class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit(this._loadChatsUseCase, this._chatsSocketService)
    : super(const ChatsState()) {
    _subscribeSocketEvents();
  }

  final LoadChatsUseCase _loadChatsUseCase;
  final ChatsSocketService _chatsSocketService;

  final List<StreamSubscription> _subscriptions = [];

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }

    return super.close();
  }

  void _subscribeSocketEvents() {
    _subscriptions.add(
      _chatsSocketService.refreshChats.listen((_) async {
        await loadChats();
      }),
    );
  }

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

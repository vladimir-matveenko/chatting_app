import 'dart:async';

import 'package:chatting_app/features/chats/domain/usecases/load_archived_chats_usecase.dart';
import 'package:chatting_app/features/chats/domain/usecases/load_chats_usecase.dart';
import 'package:chatting_app/features/chats/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/socket/chats_socket_service.dart';
import '../../domain/usecases/archive_chat_usecase.dart';
import '../../domain/usecases/return_from_archive_usecase.dart';

enum ChatsScreenStatus { active, archive }

@lazySingleton
class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit(
    this._loadChatsUseCase,
    this._loadArchivedChatsUseCase,
    this._chatsSocketService,
    this._archiveChatUseCase,
    this._returnFromArchiveUseCase,
  ) : super(const ChatsState()) {
    _subscribeSocketEvents();
  }

  final LoadChatsUseCase _loadChatsUseCase;
  final LoadArchivedChatsUseCase _loadArchivedChatsUseCase;
  final ChatsSocketService _chatsSocketService;
  final ArchiveChatUseCase _archiveChatUseCase;
  final ReturnFromArchiveUseCase _returnFromArchiveUseCase;

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
    emit(state.copyWith(isLoading: !loadSilent));
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
        emit(
          state.copyWith(
            chats: r,
            isLoading: false,
            status: ChatsScreenStatus.active,
          ),
        );
      },
    );
  }

  Future<void> loadArchivedChats({bool loadSilent = true}) async {
    emit(state.copyWith(isLoading: !loadSilent));
    final profile = await _loadArchivedChatsUseCase(NoParams());
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
        emit(
          state.copyWith(
            chats: r,
            isLoading: false,
            status: ChatsScreenStatus.archive,
          ),
        );
      },
    );
  }

  Future<void> archiveChat(String chatId) async {
    final result = await _archiveChatUseCase(ArchiveChatParams(chatId));
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
        loadChats();
      },
    );
  }

  Future<void> returnFromArchiveChat(String chatId) async {
    final result = await _returnFromArchiveUseCase(
      ReturnFromArchiveParams(chatId),
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
        loadArchivedChats();
      },
    );
  }

  Future<void> disableError() async {
    emit(state.copyWith(error: ''));
  }
}

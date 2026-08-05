import 'dart:async';

import 'package:chatting_app/features/chats/domain/usecases/load_archived_chats_usecase.dart';
import 'package:chatting_app/features/chats/domain/usecases/load_chats_usecase.dart';
import 'package:chatting_app/features/chats/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/utils/app_utils.dart';
import '../../data/socket/chats_socket_service.dart';
import '../../domain/usecases/archive_chat_usecase.dart';
import '../../domain/usecases/return_from_archive_usecase.dart';
import '../../utils.dart';

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

  final int defaultLimit = 20;

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

  Future<void> loadChatsOrArchive({String? query}) async {
    if (state.status == ChatsScreenStatus.active) {
      loadChats(query: query);
    } else {
      loadArchivedChats(query: query);
    }
  }

  Future<void> loadChats({bool loadSilent = true, String? query}) async {
    emit(state.copyWith(isLoading: !loadSilent));
    final list = await _loadChatsUseCase(
      LoadChatsParams(query: query, limit: defaultLimit, offset: 0),
    );
    list.fold(
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

  Future<void> loadMoreChats({String? query}) async {
    if (state.chats.length < defaultLimit) {
      return;
    }
    emit(state.copyWith(showLoader: true));
    final list = await _loadChatsUseCase(
      LoadChatsParams(
        query: query,
        offset: state.chats.length,
        limit: defaultLimit,
      ),
    );
    list.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            showLoader: false,
          ),
        );
      },
      (r) {
        final existingIds = state.chats.map((e) => e.id).toSet();

        final users = ChatsUtils.mergeChats(
          state.chats,
          r.where((m) => !existingIds.contains(m.id)).toList(),
        );

        emit(state.copyWith(chats: users, showLoader: false));
      },
    );
  }

  Future<void> loadArchivedChats({
    bool loadSilent = true,
    String? query,
  }) async {
    emit(state.copyWith(isLoading: !loadSilent));
    final list = await _loadArchivedChatsUseCase(
      LoadArchivedChatsParams(query: query, limit: defaultLimit, offset: 0),
    );
    list.fold(
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
            archivedChats: r,
            isLoading: false,
            status: ChatsScreenStatus.archive,
          ),
        );
      },
    );
  }

  Future<void> loadMoreArchivedChats({String? query}) async {
    if (state.archivedChats.length < defaultLimit) {
      return;
    }
    emit(state.copyWith(showLoader: true));
    final list = await _loadArchivedChatsUseCase(
      LoadArchivedChatsParams(
        query: query,
        offset: state.archivedChats.length,
        limit: defaultLimit,
      ),
    );
    list.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            showLoader: false,
          ),
        );
      },
      (r) {
        final existingIds = state.archivedChats.map((e) => e.id).toSet();

        final chats = ChatsUtils.mergeChats(
          state.archivedChats,
          r.where((m) => !existingIds.contains(m.id)).toList(),
        );

        emit(state.copyWith(archivedChats: chats, showLoader: false));
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

import 'dart:async';

import 'package:chatting_app/features/chat/data/socket/chat_socket_service.dart';
import 'package:chatting_app/features/chat/domain/usecases/add_member_usecase.dart';
import 'package:chatting_app/features/chat/domain/usecases/delete_member_usecase.dart';
import 'package:chatting_app/features/chat/domain/usecases/leave_chat_usecase.dart';
import 'package:chatting_app/features/chat/domain/usecases/mute_chat_usecase.dart';
import 'package:chatting_app/features/chat/domain/usecases/update_chat_usecase.dart';
import 'package:chatting_app/features/chat/presentation/cubit/state.dart';
import 'package:chatting_app/features/users/domain/entity/users_list_item_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../app/utils/app_utils.dart';
import '../../../../core/websocket/events/events.dart';
import '../../domain/usecases/create_chat_usecase.dart';
import '../../domain/usecases/get_chat_members_usecase.dart';
import '../../domain/usecases/get_chat_usecase.dart';

enum CreateGroupStatus { initial, setName, created }

@lazySingleton
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
    this._getChatUseCase,
    this._updateChatUseCase,
    this._getChatMembersUseCase,
    this._createChatUseCase,
    this._deleteMemberUseCase,
    this._addMemberUseCase,
    this._chatSocketService,
    this._muteChatUseCase,
    this._leaveChatUseCase,
  ) : super(const ChatState()) {
    _subscribeSocketEvents();
  }

  final GetChatUseCase _getChatUseCase;
  final UpdateChatUseCase _updateChatUseCase;
  final GetChatMembersUseCase _getChatMembersUseCase;
  final CreateChatUseCase _createChatUseCase;
  final DeleteMemberUseCase _deleteMemberUseCase;
  final AddMemberUseCase _addMemberUseCase;
  final MuteChatUseCase _muteChatUseCase;
  final LeaveChatUseCase _leaveChatUseCase;
  final ChatSocketService _chatSocketService;

  final List<StreamSubscription> _subscriptions = [];

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }

    return super.close();
  }

  void _subscribeSocketEvents() {
    _subscriptions.addAll([
      _chatSocketService.userOnline.listen(
        (event) async => _onUserOnline(event),
      ),
      _chatSocketService.userOffline.listen(
        (event) async => _onUserOffline(event),
      ),
      _chatSocketService.typingStarted.listen(
        (event) async => _onTypingStarted(event),
      ),
      _chatSocketService.typingStopped.listen(
        (event) async => _onTypingStopped(event),
      ),
      _chatSocketService.chatChanged.listen(
        (event) async => _onChatChanged(event),
      ),
    ]);
  }

  void _onUserOnline(PresenceOnlineSocketEvent event) {
    if (state.chatMembers.any((e) => e.userId == event.userId)) {
      getChatMembers(chatId: state.chat?.id ?? '');
    }
  }

  void _onUserOffline(PresenceOfflineSocketEvent event) {
    if (state.chatMembers.any((e) => e.userId == event.userId)) {
      getChatMembers(chatId: state.chat?.id ?? '');
    }
  }

  void _onTypingStarted(TypingStartedSocketEvent event) {
    // TODO(): add action
  }

  void _onTypingStopped(TypingStoppedSocketEvent event) {
    // TODO(): add action
  }

  void _onChatChanged(ChatChangedSocketEvent event) {
    if (event.chatId == state.chat?.id) {
      getChatById(event.chatId);
      getChatMembers(chatId: event.chatId);
    }
  }

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

  /// Group chat creation
  ///

  Future<void> addParticipant(UserListItemEntity participant) async {
    var selectedParticipants = [...state.selectedParticipants];
    final contains = selectedParticipants.contains(participant);
    if (contains) {
      selectedParticipants.removeWhere((e) => e.id == participant.id);
    } else {
      selectedParticipants.add(participant);
    }
    emit(state.copyWith(selectedParticipants: selectedParticipants));
  }

  Future<void> removeParticipant(UserListItemEntity participant) async {
    var selectedParticipants = [...state.selectedParticipants];
    selectedParticipants.removeWhere((e) => e.id == participant.id);
    emit(state.copyWith(selectedParticipants: selectedParticipants));
  }

  Future<void> setGroupNameStatus() async {
    emit(state.copyWith(status: CreateGroupStatus.setName));
  }

  Future<void> setInitialStatus() async {
    emit(
      state.copyWith(
        status: CreateGroupStatus.initial,
        selectedParticipants: [],
        error: '',
      ),
    );
  }

  Future<void> createGroup(String title) async {
    emit(state.copyWith(isLoading: true));
    final participantsIds = state.selectedParticipants
        .map((e) => e.id)
        .toList();
    final result = await _createChatUseCase(
      CreateChatParams(
        type: ChatType.group,
        title: title,
        memberIds: participantsIds,
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
            status: CreateGroupStatus.created,
          ),
        );
      },
    );
  }

  ///

  Future<void> getChatById(String chatId, {bool loadSilent = true}) async {
    emit(state.copyWith(isLoading: !loadSilent));
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

  Future<void> updateChat({
    required String chatId,
    String? title,
    String? avatarUrl,
  }) async {
    final result = await _updateChatUseCase(
      UpdateChatParams(chatId: chatId, title: title, avatarUrl: avatarUrl),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            closeModal: true,
          ),
        );
      },
      (r) {
        emit(state.copyWith(isLoading: false, chat: r, closeModal: true));
      },
    );
  }

  Future<void> getChatMembers({
    required String chatId,
    bool loadSilent = true,
  }) async {
    emit(state.copyWith(isLoading: !loadSilent));
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
        emit(state.copyWith(isLoading: false, chatMembers: r));
      },
    );
  }

  Future<void> deleteChatMember({
    required String chatId,
    required String userId,
  }) async {
    final result = await _deleteMemberUseCase(
      DeleteMemberParams(chatId: chatId, userId: userId),
    );
    result.fold((l) {
      emit(
        state.copyWith(
          error: AppUtils.parseFailureMessage(l),
          isLoading: false,
        ),
      );
    }, (r) {});
  }

  Future<void> addChatMember({
    required String chatId,
    required List<String> memberIds,
  }) async {
    final result = await _addMemberUseCase(
      AddMemberParams(chatId: chatId, memberIds: memberIds),
    );
    result.fold((l) {
      emit(
        state.copyWith(
          error: AppUtils.parseFailureMessage(l),
          isLoading: false,
        ),
      );
    }, (r) {});
  }

  Future<void> muteChat({required String chatId, required isMuted}) async {
    final result = await _muteChatUseCase(
      MuteChatParams(chatId: chatId, isMuted: isMuted),
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
        if (r) {
          getChatMembers(chatId: chatId);
        }
        emit(state.copyWith(isLoading: false));
      },
    );
  }

  Future<void> leaveChat(String chatId) async {
    final result = await _leaveChatUseCase(LeaveChatParams(chatId));
    result.fold((l) {
      emit(
        state.copyWith(
          error: AppUtils.parseFailureMessage(l),
          isLoading: false,
        ),
      );
    }, (r) {});
  }

  Future<void> disableError() async {
    emit(state.copyWith(error: ''));
  }

  Future<void> disableNavigate() async {
    emit(state.copyWith(shouldNavigate: false));
  }

  Future<void> disableCloseModal() async {
    emit(state.copyWith(closeModal: false));
  }
}

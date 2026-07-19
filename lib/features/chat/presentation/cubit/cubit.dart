import 'package:chatting_app/features/chat/presentation/cubit/state.dart';
import 'package:chatting_app/features/users/domain/entity/users_list_item_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../app/utils/app_utils.dart';
import '../../domain/usecases/create_chat_usecase.dart';
import '../../domain/usecases/get_chat_members_usecase.dart';
import '../../domain/usecases/get_chat_usecase.dart';

enum CreateGroupStatus { initial, setName, created }

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

  Future<void> setGroupName() async {
    emit(state.copyWith(status: CreateGroupStatus.setName));
  }

  Future<void> setInitialStatus() async {
    emit(
      state.copyWith(
        status: CreateGroupStatus.initial,
        selectedParticipants: [],
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

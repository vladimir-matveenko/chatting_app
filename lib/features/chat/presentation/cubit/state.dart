import 'package:chatting_app/features/chat/presentation/cubit/cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../users/domain/entity/users_list_item_entity.dart';
import '../../domain/entity/chat_entity.dart';
import '../../domain/entity/chat_member_entity.dart';
import '../../domain/entity/typing_user_entity.dart';

part 'state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    ChatEntity? chat,
    @Default([]) List<ChatMemberEntity> chatMembers,
    @Default([]) List<UserListItemEntity> selectedParticipants,
    String? error,
    @Default(false) bool isLoading,
    @Default(false) bool shouldNavigate,
    @Default(false) bool closeModal,
    @Default(CreateGroupStatus.initial) CreateGroupStatus status,
    TypingUserEntity? typingUserEntity,
  }) = _ChatState;
}

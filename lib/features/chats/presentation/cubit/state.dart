import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:chatting_app/features/chats/presentation/cubit/cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class ChatsState with _$ChatsState {
  const factory ChatsState({
    @Default([]) List<ChatListItemEntity> chats,
    @Default([]) List<ChatListItemEntity> archivedChats,
    String? error,
    @Default(false) bool isLoading,
    @Default(false) bool shouldNavigate,
    @Default(false) bool showLoader,
    @Default(ChatsScreenStatus.active) ChatsScreenStatus status,
  }) = _ChatsState;
}

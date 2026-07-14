import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:chatting_app/features/chats/domain/entity/chat_member_entity.dart';
import 'package:equatable/equatable.dart';

class ChatsState extends Equatable {
  const ChatsState({
    this.chats = const [],
    this.chatMembers = const [],
    this.error,
    this.isLoading = false,
  });

  final List<ChatListItemEntity> chats;
  final List<ChatMemberEntity> chatMembers;
  final String? error;
  final bool isLoading;

  ChatsState copyWith({
    List<ChatListItemEntity>? chats,
    List<ChatMemberEntity>? chatMembers,
    String? error,
    bool? isLoading,
  }) {
    return ChatsState(
      chats: chats ?? this.chats,
      chatMembers: chatMembers ?? this.chatMembers,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<dynamic> get props => [chats, chatMembers, error, isLoading];
}

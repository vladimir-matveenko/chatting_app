import 'package:chatting_app/features/chats/domain/entity/chat_entity.dart';
import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:chatting_app/features/chats/domain/entity/chat_member_entity.dart';
import 'package:equatable/equatable.dart';

class ChatState extends Equatable {
  const ChatState({
    this.chat,
    this.chatMembers = const [],
    this.error,
    this.isLoading = false,
  });

  final List<ChatMemberEntity> chatMembers;
  final ChatEntity? chat;
  final String? error;
  final bool isLoading;

  ChatState copyWith({
    List<ChatListItemEntity>? chats,
    List<ChatMemberEntity>? chatMembers,
    ChatEntity? chat,
    String? error,
    bool? isLoading,
  }) {
    return ChatState(
      chat: chat ?? this.chat,
      chatMembers: chatMembers ?? this.chatMembers,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<dynamic> get props => [chat, chatMembers, error, isLoading];
}

import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:equatable/equatable.dart';

class ChatsState extends Equatable {
  const ChatsState({this.chats = const [], this.error, this.isLoading = false});

  final List<ChatListItemEntity> chats;
  final String? error;
  final bool isLoading;

  ChatsState copyWith({
    List<ChatListItemEntity>? chats,
    String? error,
    bool? isLoading,
  }) {
    return ChatsState(
      chats: chats ?? this.chats,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<dynamic> get props => [chats, error, isLoading];
}

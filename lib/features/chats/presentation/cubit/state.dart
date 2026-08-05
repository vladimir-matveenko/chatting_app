import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:chatting_app/features/chats/presentation/cubit/cubit.dart';
import 'package:equatable/equatable.dart';

class ChatsState extends Equatable {
  const ChatsState({
    this.status = ChatsScreenStatus.active,
    this.chats = const [],
    this.error,
    this.isLoading = false,
    this.shouldNavigate = false,
  });

  final ChatsScreenStatus status;
  final List<ChatListItemEntity> chats;
  final String? error;
  final bool isLoading;
  final bool shouldNavigate;

  ChatsState copyWith({
    ChatsScreenStatus? status,
    List<ChatListItemEntity>? chats,
    String? error,
    bool? isLoading,
    bool? shouldNavigate,
  }) {
    return ChatsState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      shouldNavigate: shouldNavigate ?? this.shouldNavigate,
    );
  }

  @override
  List<dynamic> get props => [status, chats, error, isLoading, shouldNavigate];
}

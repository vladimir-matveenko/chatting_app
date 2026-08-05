import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:chatting_app/features/chats/presentation/cubit/cubit.dart';
import 'package:equatable/equatable.dart';

class ChatsState extends Equatable {
  const ChatsState({
    this.status = ChatsScreenStatus.active,
    this.chats = const [],
    this.archivedChats = const [],
    this.error,
    this.isLoading = false,
    this.shouldNavigate = false,
    this.showLoader = false,
  });

  final ChatsScreenStatus status;
  final List<ChatListItemEntity> chats;
  final List<ChatListItemEntity> archivedChats;
  final String? error;
  final bool isLoading;
  final bool shouldNavigate;
  final bool showLoader;

  ChatsState copyWith({
    ChatsScreenStatus? status,
    List<ChatListItemEntity>? chats,
    List<ChatListItemEntity>? archivedChats,
    String? error,
    bool? isLoading,
    bool? shouldNavigate,
    bool? showLoader,
  }) {
    return ChatsState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      archivedChats: archivedChats ?? this.archivedChats,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      shouldNavigate: shouldNavigate ?? this.shouldNavigate,
      showLoader: showLoader ?? this.showLoader,
    );
  }

  @override
  List<dynamic> get props => [
    status,
    chats,
    archivedChats,
    error,
    isLoading,
    shouldNavigate,
    showLoader,
  ];
}

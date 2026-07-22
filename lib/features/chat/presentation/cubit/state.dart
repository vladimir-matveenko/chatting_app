import 'package:chatting_app/features/chat/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/users/domain/entity/users_list_item_entity.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/chat_entity.dart';
import '../../domain/entity/chat_member_entity.dart';

class ChatState extends Equatable {
  const ChatState({
    this.chat,
    this.chatMembers = const [],
    this.selectedParticipants = const [],
    this.error,
    this.isLoading = false,
    this.shouldNavigate = false,
    this.closeModal = false,
    this.status = CreateGroupStatus.initial,
  });

  final List<ChatMemberEntity> chatMembers;
  final List<UserListItemEntity> selectedParticipants;
  final ChatEntity? chat;
  final String? error;
  final bool isLoading;
  final bool shouldNavigate;
  final bool closeModal;
  final CreateGroupStatus status;

  ChatState copyWith({
    List<ChatMemberEntity>? chatMembers,
    List<UserListItemEntity>? selectedParticipants,
    ChatEntity? chat,
    String? error,
    bool? isLoading,
    bool? shouldNavigate,
    bool? closeModal,
    CreateGroupStatus? status,
  }) {
    return ChatState(
      chat: chat ?? this.chat,
      chatMembers: chatMembers ?? this.chatMembers,
      selectedParticipants: selectedParticipants ?? this.selectedParticipants,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      shouldNavigate: shouldNavigate ?? this.shouldNavigate,
      status: status ?? this.status,
      closeModal: closeModal ?? this.closeModal,
    );
  }

  @override
  List<dynamic> get props => [
    chat,
    chatMembers,
    selectedParticipants,
    error,
    isLoading,
    shouldNavigate,
    status,
    closeModal,
  ];
}

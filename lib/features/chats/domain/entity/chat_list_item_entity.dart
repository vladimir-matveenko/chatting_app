import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/constants/app_enums.dart';
import '../../data/models/chat_list_participant_model.dart';

part 'chat_list_item_entity.freezed.dart';
part 'chat_list_item_entity.g.dart';

@freezed
abstract class ChatListItemEntity with _$ChatListItemEntity {
  const factory ChatListItemEntity({
    required String id,
    required ChatType type,
    String? title,
    String? avatarUrl,
    String? ownerId,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? lastMessagePreview,
    DateTime? lastMessageAt,
    required int unreadCount,
    required List<ChatListParticipantModel> participants,
    required int participantsCount,
  }) = _ChatListItemEntity;

  factory ChatListItemEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatListItemEntityFromJson(json);
}

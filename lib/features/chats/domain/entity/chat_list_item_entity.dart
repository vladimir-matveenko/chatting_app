import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/constants/app_enums.dart';

part 'chat_list_item_entity.freezed.dart';
part 'chat_list_item_entity.g.dart';

@freezed
abstract class ChatListItemEntity with _$ChatListItemEntity {
  const ChatListItemEntity._();

  const factory ChatListItemEntity({
    required String id,
    required ChatType type,
    String? title,
    String? avatarUrl,
    String? ownerId,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? lastMessage,
    DateTime? lastMessageAt,
    int? unreadCount,
  }) = _ChatListItemEntity;

  factory ChatListItemEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatListItemEntityFromJson(json);
}

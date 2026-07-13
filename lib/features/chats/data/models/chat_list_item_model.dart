import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/constants/app_enums.dart';

part 'chat_list_item_model.freezed.dart';
part 'chat_list_item_model.g.dart';

@freezed
abstract class ChatListItemModel with _$ChatListItemModel {
  const ChatListItemModel._();

  const factory ChatListItemModel({
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
  }) = _ChatListItemModel;

  factory ChatListItemModel.fromJson(Map<String, dynamic> json) =>
      _$ChatListItemModelFromJson(json);

  static List<ChatListItemModel> fromList(List<dynamic> list) {
    return AppUtils.parseList<ChatListItemModel>(
      list,
      ChatListItemModel.fromJson,
    );
  }
}

extension ChatListItemModelExt on ChatListItemModel {
  ChatListItemEntity toEntity() => ChatListItemEntity(
    id: id,
    type: type,
    title: title,
    avatarUrl: avatarUrl,
    ownerId: ownerId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    lastMessage: lastMessage,
    lastMessageAt: lastMessageAt,
    unreadCount: unreadCount,
  );
}

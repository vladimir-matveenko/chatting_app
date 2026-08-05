import 'package:chatting_app/features/chats/domain/entity/chat_list_item_entity.dart';
import 'package:flutter/material.dart';

@immutable
class ChatsUtils {
  const ChatsUtils._();

  static List<ChatListItemEntity> mergeChats(
    List<ChatListItemEntity> current,
    List<ChatListItemEntity> incoming,
  ) {
    final map = <String, ChatListItemEntity>{
      for (final m in current) m.id: m,
      for (final m in incoming) m.id: m,
    };

    final result = map.values.toList()..sort((a, b) => a.id.compareTo(b.id));

    return result;
  }
}

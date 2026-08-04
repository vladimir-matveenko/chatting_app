import 'package:chatting_app/features/users/domain/entity/users_list_item_entity.dart';
import 'package:flutter/material.dart';

@immutable
class UsersUtils {
  const UsersUtils._();

  static List<UserListItemEntity> mergeUsers(
    List<UserListItemEntity> current,
    List<UserListItemEntity> incoming,
  ) {
    final map = <String, UserListItemEntity>{
      for (final m in current) m.id: m,
      for (final m in incoming) m.id: m,
    };

    final result = map.values.toList()..sort((a, b) => a.id.compareTo(b.id));

    return result;
  }

  static bool isBottom(ScrollController scrollController) {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

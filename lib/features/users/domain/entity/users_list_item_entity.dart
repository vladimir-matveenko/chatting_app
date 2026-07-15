import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_list_item_entity.freezed.dart';
part 'users_list_item_entity.g.dart';

@freezed
abstract class UserListItemEntity with _$UserListItemEntity {
  const factory UserListItemEntity({
    required String id,
    required String userName,
    String? displayName,
    String? avatarUrl,
  }) = _UserListItemEntity;

  factory UserListItemEntity.fromJson(Map<String, dynamic> json) =>
      _$UserListItemEntityFromJson(json);
}

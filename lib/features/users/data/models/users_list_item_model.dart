import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/users_list_item_entity.dart';

part 'users_list_item_model.freezed.dart';
part 'users_list_item_model.g.dart';

@freezed
abstract class UserListItemModel with _$UserListItemModel {
  const UserListItemModel._();

  const factory UserListItemModel({
    required String id,
    required String userName,
    String? displayName,
    String? avatarUrl,
    String? privateChatId,
  }) = _UserListItemModel;

  factory UserListItemModel.fromJson(Map<String, dynamic> json) =>
      _$UserListItemModelFromJson(json);

  static List<UserListItemModel> fromList(List<dynamic> list) {
    return AppUtils.parseList<UserListItemModel>(
      list,
      UserListItemModel.fromJson,
    );
  }
}

extension UserListItemModelExt on UserListItemModel {
  UserListItemEntity toEntity() => UserListItemEntity(
    id: id,
    userName: userName,
    displayName: displayName,
    avatarUrl: avatarUrl,
    privateChatId: privateChatId,
  );
}

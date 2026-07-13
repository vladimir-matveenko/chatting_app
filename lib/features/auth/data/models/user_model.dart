import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    String? username,
    String? displayName,
    required String email,
    String? avatarUrl,
    required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  static List<UserModel> fromList(List<dynamic> list) {
    return list
        .map((jsonItem) => UserModel.fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }
}

extension UserModelExt on UserModel {
  UserEntity toEntity() => UserEntity(
    id: id,
    username: username ?? '',
    displayName: displayName ?? '',
    email: email,
    avatarUrl: avatarUrl ?? '',
    createdAt: createdAt,
  );
}

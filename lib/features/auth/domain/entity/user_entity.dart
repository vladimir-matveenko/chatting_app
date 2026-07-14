import 'package:chatting_app/features/auth/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String username,
    required String displayName,
    required String email,
    required String avatarUrl,
    required DateTime createdAt,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}

extension UserEntityExt on UserEntity {
  UserModel toModel() => UserModel(
    id: id,
    username: username,
    displayName: displayName,
    email: email,
    avatarUrl: avatarUrl,
    createdAt: createdAt,
  );
}

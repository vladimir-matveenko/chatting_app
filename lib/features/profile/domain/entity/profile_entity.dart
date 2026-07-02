import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/profile_model.dart';

part 'profile_entity.freezed.dart';
part 'profile_entity.g.dart';

@freezed
abstract class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    required String firstName,
    required String lastName,
    String? avatar,
    @Default(10) int wordCount,
  }) = _ProfileEntity;

  factory ProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfileEntityFromJson(json);
}

extension ProfileEntityExt on ProfileEntity {
  ProfileModel toModel() => ProfileModel(
    firstName: firstName,
    lastName: lastName,
    avatar: avatar,
    wordCount: wordCount,
  );
}

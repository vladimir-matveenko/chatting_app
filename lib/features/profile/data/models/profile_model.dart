import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/profile_entity.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String firstName,
    required String lastName,
    String? avatar,
    @Default(10) int wordCount,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

extension ProfileModelExt on ProfileModel {
  ProfileEntity toEntity() => ProfileEntity(
    firstName: firstName,
    lastName: lastName,
    avatar: avatar,
    wordCount: wordCount,
  );
}

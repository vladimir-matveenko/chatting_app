import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/auth_token_entity.dart';

part 'auth_token_model.freezed.dart';
part 'auth_token_model.g.dart';

@freezed
abstract class AuthTokenModel with _$AuthTokenModel {
  const factory AuthTokenModel({
    required String accessToken,
    required String refreshToken,
  }) = _AuthTokenModel;

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenModelFromJson(json);
}

extension AuthTokenModelExt on AuthTokenModel {
  AuthTokenEntity toEntity() =>
      AuthTokenEntity(accessToken: accessToken, refreshToken: refreshToken);
}

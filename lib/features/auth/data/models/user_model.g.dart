// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  userName: json['userName'] as String?,
  displayName: json['displayName'] as String?,
  email: json['email'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': ?instance.userName,
      'displayName': ?instance.displayName,
      'email': instance.email,
      'avatarUrl': ?instance.avatarUrl,
      'createdAt': instance.createdAt.toIso8601String(),
    };

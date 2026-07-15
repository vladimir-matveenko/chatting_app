// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserListItemModel _$UserListItemModelFromJson(Map<String, dynamic> json) =>
    _UserListItemModel(
      id: json['id'] as String,
      displayName: json['displayName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$UserListItemModelToJson(_UserListItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': ?instance.displayName,
      'avatarUrl': ?instance.avatarUrl,
    };

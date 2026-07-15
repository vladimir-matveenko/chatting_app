// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_list_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserListItemEntity _$UserListItemEntityFromJson(Map<String, dynamic> json) =>
    _UserListItemEntity(
      id: json['id'] as String,
      userName: json['userName'] as String,
      displayName: json['displayName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$UserListItemEntityToJson(_UserListItemEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'displayName': ?instance.displayName,
      'avatarUrl': ?instance.avatarUrl,
    };

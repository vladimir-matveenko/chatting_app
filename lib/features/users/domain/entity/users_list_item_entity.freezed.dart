// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_list_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserListItemEntity {

 String get id; String get userName; String? get displayName; String? get avatarUrl; String? get privateChatId;
/// Create a copy of UserListItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserListItemEntityCopyWith<UserListItemEntity> get copyWith => _$UserListItemEntityCopyWithImpl<UserListItemEntity>(this as UserListItemEntity, _$identity);

  /// Serializes this UserListItemEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.privateChatId, privateChatId) || other.privateChatId == privateChatId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userName,displayName,avatarUrl,privateChatId);

@override
String toString() {
  return 'UserListItemEntity(id: $id, userName: $userName, displayName: $displayName, avatarUrl: $avatarUrl, privateChatId: $privateChatId)';
}


}

/// @nodoc
abstract mixin class $UserListItemEntityCopyWith<$Res>  {
  factory $UserListItemEntityCopyWith(UserListItemEntity value, $Res Function(UserListItemEntity) _then) = _$UserListItemEntityCopyWithImpl;
@useResult
$Res call({
 String id, String userName, String? displayName, String? avatarUrl, String? privateChatId
});




}
/// @nodoc
class _$UserListItemEntityCopyWithImpl<$Res>
    implements $UserListItemEntityCopyWith<$Res> {
  _$UserListItemEntityCopyWithImpl(this._self, this._then);

  final UserListItemEntity _self;
  final $Res Function(UserListItemEntity) _then;

/// Create a copy of UserListItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userName = null,Object? displayName = freezed,Object? avatarUrl = freezed,Object? privateChatId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,privateChatId: freezed == privateChatId ? _self.privateChatId : privateChatId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserListItemEntity].
extension UserListItemEntityPatterns on UserListItemEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserListItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserListItemEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserListItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserListItemEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserListItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserListItemEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userName,  String? displayName,  String? avatarUrl,  String? privateChatId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserListItemEntity() when $default != null:
return $default(_that.id,_that.userName,_that.displayName,_that.avatarUrl,_that.privateChatId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userName,  String? displayName,  String? avatarUrl,  String? privateChatId)  $default,) {final _that = this;
switch (_that) {
case _UserListItemEntity():
return $default(_that.id,_that.userName,_that.displayName,_that.avatarUrl,_that.privateChatId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userName,  String? displayName,  String? avatarUrl,  String? privateChatId)?  $default,) {final _that = this;
switch (_that) {
case _UserListItemEntity() when $default != null:
return $default(_that.id,_that.userName,_that.displayName,_that.avatarUrl,_that.privateChatId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserListItemEntity implements UserListItemEntity {
  const _UserListItemEntity({required this.id, required this.userName, this.displayName, this.avatarUrl, this.privateChatId});
  factory _UserListItemEntity.fromJson(Map<String, dynamic> json) => _$UserListItemEntityFromJson(json);

@override final  String id;
@override final  String userName;
@override final  String? displayName;
@override final  String? avatarUrl;
@override final  String? privateChatId;

/// Create a copy of UserListItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserListItemEntityCopyWith<_UserListItemEntity> get copyWith => __$UserListItemEntityCopyWithImpl<_UserListItemEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserListItemEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserListItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.privateChatId, privateChatId) || other.privateChatId == privateChatId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userName,displayName,avatarUrl,privateChatId);

@override
String toString() {
  return 'UserListItemEntity(id: $id, userName: $userName, displayName: $displayName, avatarUrl: $avatarUrl, privateChatId: $privateChatId)';
}


}

/// @nodoc
abstract mixin class _$UserListItemEntityCopyWith<$Res> implements $UserListItemEntityCopyWith<$Res> {
  factory _$UserListItemEntityCopyWith(_UserListItemEntity value, $Res Function(_UserListItemEntity) _then) = __$UserListItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String userName, String? displayName, String? avatarUrl, String? privateChatId
});




}
/// @nodoc
class __$UserListItemEntityCopyWithImpl<$Res>
    implements _$UserListItemEntityCopyWith<$Res> {
  __$UserListItemEntityCopyWithImpl(this._self, this._then);

  final _UserListItemEntity _self;
  final $Res Function(_UserListItemEntity) _then;

/// Create a copy of UserListItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userName = null,Object? displayName = freezed,Object? avatarUrl = freezed,Object? privateChatId = freezed,}) {
  return _then(_UserListItemEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,privateChatId: freezed == privateChatId ? _self.privateChatId : privateChatId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

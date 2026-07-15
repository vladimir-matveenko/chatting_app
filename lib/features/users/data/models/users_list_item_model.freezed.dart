// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserListItemModel {

 String get id; String get userName; String? get displayName; String? get avatarUrl;
/// Create a copy of UserListItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserListItemModelCopyWith<UserListItemModel> get copyWith => _$UserListItemModelCopyWithImpl<UserListItemModel>(this as UserListItemModel, _$identity);

  /// Serializes this UserListItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userName,displayName,avatarUrl);

@override
String toString() {
  return 'UserListItemModel(id: $id, userName: $userName, displayName: $displayName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $UserListItemModelCopyWith<$Res>  {
  factory $UserListItemModelCopyWith(UserListItemModel value, $Res Function(UserListItemModel) _then) = _$UserListItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String userName, String? displayName, String? avatarUrl
});




}
/// @nodoc
class _$UserListItemModelCopyWithImpl<$Res>
    implements $UserListItemModelCopyWith<$Res> {
  _$UserListItemModelCopyWithImpl(this._self, this._then);

  final UserListItemModel _self;
  final $Res Function(UserListItemModel) _then;

/// Create a copy of UserListItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userName = null,Object? displayName = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserListItemModel].
extension UserListItemModelPatterns on UserListItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserListItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserListItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserListItemModel value)  $default,){
final _that = this;
switch (_that) {
case _UserListItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserListItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserListItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userName,  String? displayName,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserListItemModel() when $default != null:
return $default(_that.id,_that.userName,_that.displayName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userName,  String? displayName,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _UserListItemModel():
return $default(_that.id,_that.userName,_that.displayName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userName,  String? displayName,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _UserListItemModel() when $default != null:
return $default(_that.id,_that.userName,_that.displayName,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserListItemModel extends UserListItemModel {
  const _UserListItemModel({required this.id, required this.userName, this.displayName, this.avatarUrl}): super._();
  factory _UserListItemModel.fromJson(Map<String, dynamic> json) => _$UserListItemModelFromJson(json);

@override final  String id;
@override final  String userName;
@override final  String? displayName;
@override final  String? avatarUrl;

/// Create a copy of UserListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserListItemModelCopyWith<_UserListItemModel> get copyWith => __$UserListItemModelCopyWithImpl<_UserListItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserListItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userName,displayName,avatarUrl);

@override
String toString() {
  return 'UserListItemModel(id: $id, userName: $userName, displayName: $displayName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$UserListItemModelCopyWith<$Res> implements $UserListItemModelCopyWith<$Res> {
  factory _$UserListItemModelCopyWith(_UserListItemModel value, $Res Function(_UserListItemModel) _then) = __$UserListItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userName, String? displayName, String? avatarUrl
});




}
/// @nodoc
class __$UserListItemModelCopyWithImpl<$Res>
    implements _$UserListItemModelCopyWith<$Res> {
  __$UserListItemModelCopyWithImpl(this._self, this._then);

  final _UserListItemModel _self;
  final $Res Function(_UserListItemModel) _then;

/// Create a copy of UserListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userName = null,Object? displayName = freezed,Object? avatarUrl = freezed,}) {
  return _then(_UserListItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

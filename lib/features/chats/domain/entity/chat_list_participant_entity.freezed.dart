// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_list_participant_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatListParticipantEntity {

 String get username; String? get displayName; String? get avatarUrl;
/// Create a copy of ChatListParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatListParticipantEntityCopyWith<ChatListParticipantEntity> get copyWith => _$ChatListParticipantEntityCopyWithImpl<ChatListParticipantEntity>(this as ChatListParticipantEntity, _$identity);

  /// Serializes this ChatListParticipantEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatListParticipantEntity&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,displayName,avatarUrl);

@override
String toString() {
  return 'ChatListParticipantEntity(username: $username, displayName: $displayName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $ChatListParticipantEntityCopyWith<$Res>  {
  factory $ChatListParticipantEntityCopyWith(ChatListParticipantEntity value, $Res Function(ChatListParticipantEntity) _then) = _$ChatListParticipantEntityCopyWithImpl;
@useResult
$Res call({
 String username, String? displayName, String? avatarUrl
});




}
/// @nodoc
class _$ChatListParticipantEntityCopyWithImpl<$Res>
    implements $ChatListParticipantEntityCopyWith<$Res> {
  _$ChatListParticipantEntityCopyWithImpl(this._self, this._then);

  final ChatListParticipantEntity _self;
  final $Res Function(ChatListParticipantEntity) _then;

/// Create a copy of ChatListParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? displayName = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatListParticipantEntity].
extension ChatListParticipantEntityPatterns on ChatListParticipantEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatListParticipantEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatListParticipantEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatListParticipantEntity value)  $default,){
final _that = this;
switch (_that) {
case _ChatListParticipantEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatListParticipantEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ChatListParticipantEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String? displayName,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatListParticipantEntity() when $default != null:
return $default(_that.username,_that.displayName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String? displayName,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _ChatListParticipantEntity():
return $default(_that.username,_that.displayName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String? displayName,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _ChatListParticipantEntity() when $default != null:
return $default(_that.username,_that.displayName,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatListParticipantEntity implements ChatListParticipantEntity {
  const _ChatListParticipantEntity({required this.username, this.displayName, this.avatarUrl});
  factory _ChatListParticipantEntity.fromJson(Map<String, dynamic> json) => _$ChatListParticipantEntityFromJson(json);

@override final  String username;
@override final  String? displayName;
@override final  String? avatarUrl;

/// Create a copy of ChatListParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatListParticipantEntityCopyWith<_ChatListParticipantEntity> get copyWith => __$ChatListParticipantEntityCopyWithImpl<_ChatListParticipantEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatListParticipantEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatListParticipantEntity&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,displayName,avatarUrl);

@override
String toString() {
  return 'ChatListParticipantEntity(username: $username, displayName: $displayName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$ChatListParticipantEntityCopyWith<$Res> implements $ChatListParticipantEntityCopyWith<$Res> {
  factory _$ChatListParticipantEntityCopyWith(_ChatListParticipantEntity value, $Res Function(_ChatListParticipantEntity) _then) = __$ChatListParticipantEntityCopyWithImpl;
@override @useResult
$Res call({
 String username, String? displayName, String? avatarUrl
});




}
/// @nodoc
class __$ChatListParticipantEntityCopyWithImpl<$Res>
    implements _$ChatListParticipantEntityCopyWith<$Res> {
  __$ChatListParticipantEntityCopyWithImpl(this._self, this._then);

  final _ChatListParticipantEntity _self;
  final $Res Function(_ChatListParticipantEntity) _then;

/// Create a copy of ChatListParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? displayName = freezed,Object? avatarUrl = freezed,}) {
  return _then(_ChatListParticipantEntity(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

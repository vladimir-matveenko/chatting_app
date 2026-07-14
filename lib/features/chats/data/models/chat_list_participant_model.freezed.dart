// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_list_participant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatListParticipantModel {

 String get username; String? get displayName; String? get avatarUrl;
/// Create a copy of ChatListParticipantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatListParticipantModelCopyWith<ChatListParticipantModel> get copyWith => _$ChatListParticipantModelCopyWithImpl<ChatListParticipantModel>(this as ChatListParticipantModel, _$identity);

  /// Serializes this ChatListParticipantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatListParticipantModel&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,displayName,avatarUrl);

@override
String toString() {
  return 'ChatListParticipantModel(username: $username, displayName: $displayName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $ChatListParticipantModelCopyWith<$Res>  {
  factory $ChatListParticipantModelCopyWith(ChatListParticipantModel value, $Res Function(ChatListParticipantModel) _then) = _$ChatListParticipantModelCopyWithImpl;
@useResult
$Res call({
 String username, String? displayName, String? avatarUrl
});




}
/// @nodoc
class _$ChatListParticipantModelCopyWithImpl<$Res>
    implements $ChatListParticipantModelCopyWith<$Res> {
  _$ChatListParticipantModelCopyWithImpl(this._self, this._then);

  final ChatListParticipantModel _self;
  final $Res Function(ChatListParticipantModel) _then;

/// Create a copy of ChatListParticipantModel
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


/// Adds pattern-matching-related methods to [ChatListParticipantModel].
extension ChatListParticipantModelPatterns on ChatListParticipantModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatListParticipantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatListParticipantModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatListParticipantModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatListParticipantModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatListParticipantModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatListParticipantModel() when $default != null:
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
case _ChatListParticipantModel() when $default != null:
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
case _ChatListParticipantModel():
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
case _ChatListParticipantModel() when $default != null:
return $default(_that.username,_that.displayName,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatListParticipantModel extends ChatListParticipantModel {
  const _ChatListParticipantModel({required this.username, this.displayName, this.avatarUrl}): super._();
  factory _ChatListParticipantModel.fromJson(Map<String, dynamic> json) => _$ChatListParticipantModelFromJson(json);

@override final  String username;
@override final  String? displayName;
@override final  String? avatarUrl;

/// Create a copy of ChatListParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatListParticipantModelCopyWith<_ChatListParticipantModel> get copyWith => __$ChatListParticipantModelCopyWithImpl<_ChatListParticipantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatListParticipantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatListParticipantModel&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,displayName,avatarUrl);

@override
String toString() {
  return 'ChatListParticipantModel(username: $username, displayName: $displayName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$ChatListParticipantModelCopyWith<$Res> implements $ChatListParticipantModelCopyWith<$Res> {
  factory _$ChatListParticipantModelCopyWith(_ChatListParticipantModel value, $Res Function(_ChatListParticipantModel) _then) = __$ChatListParticipantModelCopyWithImpl;
@override @useResult
$Res call({
 String username, String? displayName, String? avatarUrl
});




}
/// @nodoc
class __$ChatListParticipantModelCopyWithImpl<$Res>
    implements _$ChatListParticipantModelCopyWith<$Res> {
  __$ChatListParticipantModelCopyWithImpl(this._self, this._then);

  final _ChatListParticipantModel _self;
  final $Res Function(_ChatListParticipantModel) _then;

/// Create a copy of ChatListParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? displayName = freezed,Object? avatarUrl = freezed,}) {
  return _then(_ChatListParticipantModel(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

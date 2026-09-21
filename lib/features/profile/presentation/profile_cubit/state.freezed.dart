// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {

 PackageInfo? get appInfo; UserEntity? get profile; String? get error; bool get isLoading; bool get isAvatarLoading; bool get isAppInfoLoading; bool get createdSuccessful; bool get updatedSuccessful; List<String> get log;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.appInfo, appInfo) || other.appInfo == appInfo)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isAvatarLoading, isAvatarLoading) || other.isAvatarLoading == isAvatarLoading)&&(identical(other.isAppInfoLoading, isAppInfoLoading) || other.isAppInfoLoading == isAppInfoLoading)&&(identical(other.createdSuccessful, createdSuccessful) || other.createdSuccessful == createdSuccessful)&&(identical(other.updatedSuccessful, updatedSuccessful) || other.updatedSuccessful == updatedSuccessful)&&const DeepCollectionEquality().equals(other.log, log));
}


@override
int get hashCode => Object.hash(runtimeType,appInfo,profile,error,isLoading,isAvatarLoading,isAppInfoLoading,createdSuccessful,updatedSuccessful,const DeepCollectionEquality().hash(log));

@override
String toString() {
  return 'ProfileState(appInfo: $appInfo, profile: $profile, error: $error, isLoading: $isLoading, isAvatarLoading: $isAvatarLoading, isAppInfoLoading: $isAppInfoLoading, createdSuccessful: $createdSuccessful, updatedSuccessful: $updatedSuccessful, log: $log)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 PackageInfo? appInfo, UserEntity? profile, String? error, bool isLoading, bool isAvatarLoading, bool isAppInfoLoading, bool createdSuccessful, bool updatedSuccessful, List<String> log
});


$UserEntityCopyWith<$Res>? get profile;

}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appInfo = freezed,Object? profile = freezed,Object? error = freezed,Object? isLoading = null,Object? isAvatarLoading = null,Object? isAppInfoLoading = null,Object? createdSuccessful = null,Object? updatedSuccessful = null,Object? log = null,}) {
  return _then(_self.copyWith(
appInfo: freezed == appInfo ? _self.appInfo : appInfo // ignore: cast_nullable_to_non_nullable
as PackageInfo?,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserEntity?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isAvatarLoading: null == isAvatarLoading ? _self.isAvatarLoading : isAvatarLoading // ignore: cast_nullable_to_non_nullable
as bool,isAppInfoLoading: null == isAppInfoLoading ? _self.isAppInfoLoading : isAppInfoLoading // ignore: cast_nullable_to_non_nullable
as bool,createdSuccessful: null == createdSuccessful ? _self.createdSuccessful : createdSuccessful // ignore: cast_nullable_to_non_nullable
as bool,updatedSuccessful: null == updatedSuccessful ? _self.updatedSuccessful : updatedSuccessful // ignore: cast_nullable_to_non_nullable
as bool,log: null == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $UserEntityCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PackageInfo? appInfo,  UserEntity? profile,  String? error,  bool isLoading,  bool isAvatarLoading,  bool isAppInfoLoading,  bool createdSuccessful,  bool updatedSuccessful,  List<String> log)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.appInfo,_that.profile,_that.error,_that.isLoading,_that.isAvatarLoading,_that.isAppInfoLoading,_that.createdSuccessful,_that.updatedSuccessful,_that.log);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PackageInfo? appInfo,  UserEntity? profile,  String? error,  bool isLoading,  bool isAvatarLoading,  bool isAppInfoLoading,  bool createdSuccessful,  bool updatedSuccessful,  List<String> log)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.appInfo,_that.profile,_that.error,_that.isLoading,_that.isAvatarLoading,_that.isAppInfoLoading,_that.createdSuccessful,_that.updatedSuccessful,_that.log);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PackageInfo? appInfo,  UserEntity? profile,  String? error,  bool isLoading,  bool isAvatarLoading,  bool isAppInfoLoading,  bool createdSuccessful,  bool updatedSuccessful,  List<String> log)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.appInfo,_that.profile,_that.error,_that.isLoading,_that.isAvatarLoading,_that.isAppInfoLoading,_that.createdSuccessful,_that.updatedSuccessful,_that.log);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState implements ProfileState {
  const _ProfileState({this.appInfo, this.profile, this.error, this.isLoading = false, this.isAvatarLoading = false, this.isAppInfoLoading = false, this.createdSuccessful = false, this.updatedSuccessful = false, final  List<String> log = const []}): _log = log;
  

@override final  PackageInfo? appInfo;
@override final  UserEntity? profile;
@override final  String? error;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isAvatarLoading;
@override@JsonKey() final  bool isAppInfoLoading;
@override@JsonKey() final  bool createdSuccessful;
@override@JsonKey() final  bool updatedSuccessful;
 final  List<String> _log;
@override@JsonKey() List<String> get log {
  if (_log is EqualUnmodifiableListView) return _log;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_log);
}


/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.appInfo, appInfo) || other.appInfo == appInfo)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isAvatarLoading, isAvatarLoading) || other.isAvatarLoading == isAvatarLoading)&&(identical(other.isAppInfoLoading, isAppInfoLoading) || other.isAppInfoLoading == isAppInfoLoading)&&(identical(other.createdSuccessful, createdSuccessful) || other.createdSuccessful == createdSuccessful)&&(identical(other.updatedSuccessful, updatedSuccessful) || other.updatedSuccessful == updatedSuccessful)&&const DeepCollectionEquality().equals(other._log, _log));
}


@override
int get hashCode => Object.hash(runtimeType,appInfo,profile,error,isLoading,isAvatarLoading,isAppInfoLoading,createdSuccessful,updatedSuccessful,const DeepCollectionEquality().hash(_log));

@override
String toString() {
  return 'ProfileState(appInfo: $appInfo, profile: $profile, error: $error, isLoading: $isLoading, isAvatarLoading: $isAvatarLoading, isAppInfoLoading: $isAppInfoLoading, createdSuccessful: $createdSuccessful, updatedSuccessful: $updatedSuccessful, log: $log)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 PackageInfo? appInfo, UserEntity? profile, String? error, bool isLoading, bool isAvatarLoading, bool isAppInfoLoading, bool createdSuccessful, bool updatedSuccessful, List<String> log
});


@override $UserEntityCopyWith<$Res>? get profile;

}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appInfo = freezed,Object? profile = freezed,Object? error = freezed,Object? isLoading = null,Object? isAvatarLoading = null,Object? isAppInfoLoading = null,Object? createdSuccessful = null,Object? updatedSuccessful = null,Object? log = null,}) {
  return _then(_ProfileState(
appInfo: freezed == appInfo ? _self.appInfo : appInfo // ignore: cast_nullable_to_non_nullable
as PackageInfo?,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserEntity?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isAvatarLoading: null == isAvatarLoading ? _self.isAvatarLoading : isAvatarLoading // ignore: cast_nullable_to_non_nullable
as bool,isAppInfoLoading: null == isAppInfoLoading ? _self.isAppInfoLoading : isAppInfoLoading // ignore: cast_nullable_to_non_nullable
as bool,createdSuccessful: null == createdSuccessful ? _self.createdSuccessful : createdSuccessful // ignore: cast_nullable_to_non_nullable
as bool,updatedSuccessful: null == updatedSuccessful ? _self.updatedSuccessful : updatedSuccessful // ignore: cast_nullable_to_non_nullable
as bool,log: null == log ? _self._log : log // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $UserEntityCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

// dart format on

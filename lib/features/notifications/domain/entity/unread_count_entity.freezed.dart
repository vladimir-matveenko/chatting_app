// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unread_count_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnreadCountEntity {

 int get unreadCount;
/// Create a copy of UnreadCountEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnreadCountEntityCopyWith<UnreadCountEntity> get copyWith => _$UnreadCountEntityCopyWithImpl<UnreadCountEntity>(this as UnreadCountEntity, _$identity);

  /// Serializes this UnreadCountEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnreadCountEntity&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unreadCount);

@override
String toString() {
  return 'UnreadCountEntity(unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class $UnreadCountEntityCopyWith<$Res>  {
  factory $UnreadCountEntityCopyWith(UnreadCountEntity value, $Res Function(UnreadCountEntity) _then) = _$UnreadCountEntityCopyWithImpl;
@useResult
$Res call({
 int unreadCount
});




}
/// @nodoc
class _$UnreadCountEntityCopyWithImpl<$Res>
    implements $UnreadCountEntityCopyWith<$Res> {
  _$UnreadCountEntityCopyWithImpl(this._self, this._then);

  final UnreadCountEntity _self;
  final $Res Function(UnreadCountEntity) _then;

/// Create a copy of UnreadCountEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unreadCount = null,}) {
  return _then(_self.copyWith(
unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UnreadCountEntity].
extension UnreadCountEntityPatterns on UnreadCountEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnreadCountEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnreadCountEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnreadCountEntity value)  $default,){
final _that = this;
switch (_that) {
case _UnreadCountEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnreadCountEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UnreadCountEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int unreadCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnreadCountEntity() when $default != null:
return $default(_that.unreadCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int unreadCount)  $default,) {final _that = this;
switch (_that) {
case _UnreadCountEntity():
return $default(_that.unreadCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int unreadCount)?  $default,) {final _that = this;
switch (_that) {
case _UnreadCountEntity() when $default != null:
return $default(_that.unreadCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnreadCountEntity implements UnreadCountEntity {
  const _UnreadCountEntity({required this.unreadCount});
  factory _UnreadCountEntity.fromJson(Map<String, dynamic> json) => _$UnreadCountEntityFromJson(json);

@override final  int unreadCount;

/// Create a copy of UnreadCountEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnreadCountEntityCopyWith<_UnreadCountEntity> get copyWith => __$UnreadCountEntityCopyWithImpl<_UnreadCountEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnreadCountEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnreadCountEntity&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unreadCount);

@override
String toString() {
  return 'UnreadCountEntity(unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class _$UnreadCountEntityCopyWith<$Res> implements $UnreadCountEntityCopyWith<$Res> {
  factory _$UnreadCountEntityCopyWith(_UnreadCountEntity value, $Res Function(_UnreadCountEntity) _then) = __$UnreadCountEntityCopyWithImpl;
@override @useResult
$Res call({
 int unreadCount
});




}
/// @nodoc
class __$UnreadCountEntityCopyWithImpl<$Res>
    implements _$UnreadCountEntityCopyWith<$Res> {
  __$UnreadCountEntityCopyWithImpl(this._self, this._then);

  final _UnreadCountEntity _self;
  final $Res Function(_UnreadCountEntity) _then;

/// Create a copy of UnreadCountEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unreadCount = null,}) {
  return _then(_UnreadCountEntity(
unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

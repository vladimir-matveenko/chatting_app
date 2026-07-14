// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_reaction_summary_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageReactionSummaryEntity {

 ReactionType get type; int get count;
/// Create a copy of MessageReactionSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageReactionSummaryEntityCopyWith<MessageReactionSummaryEntity> get copyWith => _$MessageReactionSummaryEntityCopyWithImpl<MessageReactionSummaryEntity>(this as MessageReactionSummaryEntity, _$identity);

  /// Serializes this MessageReactionSummaryEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageReactionSummaryEntity&&(identical(other.type, type) || other.type == type)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,count);

@override
String toString() {
  return 'MessageReactionSummaryEntity(type: $type, count: $count)';
}


}

/// @nodoc
abstract mixin class $MessageReactionSummaryEntityCopyWith<$Res>  {
  factory $MessageReactionSummaryEntityCopyWith(MessageReactionSummaryEntity value, $Res Function(MessageReactionSummaryEntity) _then) = _$MessageReactionSummaryEntityCopyWithImpl;
@useResult
$Res call({
 ReactionType type, int count
});




}
/// @nodoc
class _$MessageReactionSummaryEntityCopyWithImpl<$Res>
    implements $MessageReactionSummaryEntityCopyWith<$Res> {
  _$MessageReactionSummaryEntityCopyWithImpl(this._self, this._then);

  final MessageReactionSummaryEntity _self;
  final $Res Function(MessageReactionSummaryEntity) _then;

/// Create a copy of MessageReactionSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? count = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReactionType,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageReactionSummaryEntity].
extension MessageReactionSummaryEntityPatterns on MessageReactionSummaryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageReactionSummaryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageReactionSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageReactionSummaryEntity value)  $default,){
final _that = this;
switch (_that) {
case _MessageReactionSummaryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageReactionSummaryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MessageReactionSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReactionType type,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageReactionSummaryEntity() when $default != null:
return $default(_that.type,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReactionType type,  int count)  $default,) {final _that = this;
switch (_that) {
case _MessageReactionSummaryEntity():
return $default(_that.type,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReactionType type,  int count)?  $default,) {final _that = this;
switch (_that) {
case _MessageReactionSummaryEntity() when $default != null:
return $default(_that.type,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageReactionSummaryEntity implements MessageReactionSummaryEntity {
  const _MessageReactionSummaryEntity({required this.type, required this.count});
  factory _MessageReactionSummaryEntity.fromJson(Map<String, dynamic> json) => _$MessageReactionSummaryEntityFromJson(json);

@override final  ReactionType type;
@override final  int count;

/// Create a copy of MessageReactionSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageReactionSummaryEntityCopyWith<_MessageReactionSummaryEntity> get copyWith => __$MessageReactionSummaryEntityCopyWithImpl<_MessageReactionSummaryEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageReactionSummaryEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageReactionSummaryEntity&&(identical(other.type, type) || other.type == type)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,count);

@override
String toString() {
  return 'MessageReactionSummaryEntity(type: $type, count: $count)';
}


}

/// @nodoc
abstract mixin class _$MessageReactionSummaryEntityCopyWith<$Res> implements $MessageReactionSummaryEntityCopyWith<$Res> {
  factory _$MessageReactionSummaryEntityCopyWith(_MessageReactionSummaryEntity value, $Res Function(_MessageReactionSummaryEntity) _then) = __$MessageReactionSummaryEntityCopyWithImpl;
@override @useResult
$Res call({
 ReactionType type, int count
});




}
/// @nodoc
class __$MessageReactionSummaryEntityCopyWithImpl<$Res>
    implements _$MessageReactionSummaryEntityCopyWith<$Res> {
  __$MessageReactionSummaryEntityCopyWithImpl(this._self, this._then);

  final _MessageReactionSummaryEntity _self;
  final $Res Function(_MessageReactionSummaryEntity) _then;

/// Create a copy of MessageReactionSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? count = null,}) {
  return _then(_MessageReactionSummaryEntity(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReactionType,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

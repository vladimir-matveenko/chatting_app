// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'around_context_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AroundContextEntity {

 String get targetMessageId; bool get hasPrevious; bool get hasNext; List<MessageEntity> get messages;
/// Create a copy of AroundContextEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AroundContextEntityCopyWith<AroundContextEntity> get copyWith => _$AroundContextEntityCopyWithImpl<AroundContextEntity>(this as AroundContextEntity, _$identity);

  /// Serializes this AroundContextEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AroundContextEntity&&(identical(other.targetMessageId, targetMessageId) || other.targetMessageId == targetMessageId)&&(identical(other.hasPrevious, hasPrevious) || other.hasPrevious == hasPrevious)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&const DeepCollectionEquality().equals(other.messages, messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetMessageId,hasPrevious,hasNext,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'AroundContextEntity(targetMessageId: $targetMessageId, hasPrevious: $hasPrevious, hasNext: $hasNext, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $AroundContextEntityCopyWith<$Res>  {
  factory $AroundContextEntityCopyWith(AroundContextEntity value, $Res Function(AroundContextEntity) _then) = _$AroundContextEntityCopyWithImpl;
@useResult
$Res call({
 String targetMessageId, bool hasPrevious, bool hasNext, List<MessageEntity> messages
});




}
/// @nodoc
class _$AroundContextEntityCopyWithImpl<$Res>
    implements $AroundContextEntityCopyWith<$Res> {
  _$AroundContextEntityCopyWithImpl(this._self, this._then);

  final AroundContextEntity _self;
  final $Res Function(AroundContextEntity) _then;

/// Create a copy of AroundContextEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? targetMessageId = null,Object? hasPrevious = null,Object? hasNext = null,Object? messages = null,}) {
  return _then(_self.copyWith(
targetMessageId: null == targetMessageId ? _self.targetMessageId : targetMessageId // ignore: cast_nullable_to_non_nullable
as String,hasPrevious: null == hasPrevious ? _self.hasPrevious : hasPrevious // ignore: cast_nullable_to_non_nullable
as bool,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [AroundContextEntity].
extension AroundContextEntityPatterns on AroundContextEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AroundContextEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AroundContextEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AroundContextEntity value)  $default,){
final _that = this;
switch (_that) {
case _AroundContextEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AroundContextEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AroundContextEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String targetMessageId,  bool hasPrevious,  bool hasNext,  List<MessageEntity> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AroundContextEntity() when $default != null:
return $default(_that.targetMessageId,_that.hasPrevious,_that.hasNext,_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String targetMessageId,  bool hasPrevious,  bool hasNext,  List<MessageEntity> messages)  $default,) {final _that = this;
switch (_that) {
case _AroundContextEntity():
return $default(_that.targetMessageId,_that.hasPrevious,_that.hasNext,_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String targetMessageId,  bool hasPrevious,  bool hasNext,  List<MessageEntity> messages)?  $default,) {final _that = this;
switch (_that) {
case _AroundContextEntity() when $default != null:
return $default(_that.targetMessageId,_that.hasPrevious,_that.hasNext,_that.messages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AroundContextEntity implements AroundContextEntity {
  const _AroundContextEntity({required this.targetMessageId, required this.hasPrevious, required this.hasNext, required final  List<MessageEntity> messages}): _messages = messages;
  factory _AroundContextEntity.fromJson(Map<String, dynamic> json) => _$AroundContextEntityFromJson(json);

@override final  String targetMessageId;
@override final  bool hasPrevious;
@override final  bool hasNext;
 final  List<MessageEntity> _messages;
@override List<MessageEntity> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of AroundContextEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AroundContextEntityCopyWith<_AroundContextEntity> get copyWith => __$AroundContextEntityCopyWithImpl<_AroundContextEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AroundContextEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AroundContextEntity&&(identical(other.targetMessageId, targetMessageId) || other.targetMessageId == targetMessageId)&&(identical(other.hasPrevious, hasPrevious) || other.hasPrevious == hasPrevious)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&const DeepCollectionEquality().equals(other._messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetMessageId,hasPrevious,hasNext,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'AroundContextEntity(targetMessageId: $targetMessageId, hasPrevious: $hasPrevious, hasNext: $hasNext, messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$AroundContextEntityCopyWith<$Res> implements $AroundContextEntityCopyWith<$Res> {
  factory _$AroundContextEntityCopyWith(_AroundContextEntity value, $Res Function(_AroundContextEntity) _then) = __$AroundContextEntityCopyWithImpl;
@override @useResult
$Res call({
 String targetMessageId, bool hasPrevious, bool hasNext, List<MessageEntity> messages
});




}
/// @nodoc
class __$AroundContextEntityCopyWithImpl<$Res>
    implements _$AroundContextEntityCopyWith<$Res> {
  __$AroundContextEntityCopyWithImpl(this._self, this._then);

  final _AroundContextEntity _self;
  final $Res Function(_AroundContextEntity) _then;

/// Create a copy of AroundContextEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? targetMessageId = null,Object? hasPrevious = null,Object? hasNext = null,Object? messages = null,}) {
  return _then(_AroundContextEntity(
targetMessageId: null == targetMessageId ? _self.targetMessageId : targetMessageId // ignore: cast_nullable_to_non_nullable
as String,hasPrevious: null == hasPrevious ? _self.hasPrevious : hasPrevious // ignore: cast_nullable_to_non_nullable
as bool,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageEntity>,
  ));
}


}

// dart format on

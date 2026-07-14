// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_reaction_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageReactionEntity {

 String get id; String get messageId; ReactionType get type; DateTime get createdAt;
/// Create a copy of MessageReactionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageReactionEntityCopyWith<MessageReactionEntity> get copyWith => _$MessageReactionEntityCopyWithImpl<MessageReactionEntity>(this as MessageReactionEntity, _$identity);

  /// Serializes this MessageReactionEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageReactionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,messageId,type,createdAt);

@override
String toString() {
  return 'MessageReactionEntity(id: $id, messageId: $messageId, type: $type, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MessageReactionEntityCopyWith<$Res>  {
  factory $MessageReactionEntityCopyWith(MessageReactionEntity value, $Res Function(MessageReactionEntity) _then) = _$MessageReactionEntityCopyWithImpl;
@useResult
$Res call({
 String id, String messageId, ReactionType type, DateTime createdAt
});




}
/// @nodoc
class _$MessageReactionEntityCopyWithImpl<$Res>
    implements $MessageReactionEntityCopyWith<$Res> {
  _$MessageReactionEntityCopyWithImpl(this._self, this._then);

  final MessageReactionEntity _self;
  final $Res Function(MessageReactionEntity) _then;

/// Create a copy of MessageReactionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? messageId = null,Object? type = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReactionType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageReactionEntity].
extension MessageReactionEntityPatterns on MessageReactionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageReactionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageReactionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageReactionEntity value)  $default,){
final _that = this;
switch (_that) {
case _MessageReactionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageReactionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MessageReactionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String messageId,  ReactionType type,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageReactionEntity() when $default != null:
return $default(_that.id,_that.messageId,_that.type,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String messageId,  ReactionType type,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _MessageReactionEntity():
return $default(_that.id,_that.messageId,_that.type,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String messageId,  ReactionType type,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MessageReactionEntity() when $default != null:
return $default(_that.id,_that.messageId,_that.type,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageReactionEntity implements MessageReactionEntity {
  const _MessageReactionEntity({required this.id, required this.messageId, required this.type, required this.createdAt});
  factory _MessageReactionEntity.fromJson(Map<String, dynamic> json) => _$MessageReactionEntityFromJson(json);

@override final  String id;
@override final  String messageId;
@override final  ReactionType type;
@override final  DateTime createdAt;

/// Create a copy of MessageReactionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageReactionEntityCopyWith<_MessageReactionEntity> get copyWith => __$MessageReactionEntityCopyWithImpl<_MessageReactionEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageReactionEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageReactionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,messageId,type,createdAt);

@override
String toString() {
  return 'MessageReactionEntity(id: $id, messageId: $messageId, type: $type, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MessageReactionEntityCopyWith<$Res> implements $MessageReactionEntityCopyWith<$Res> {
  factory _$MessageReactionEntityCopyWith(_MessageReactionEntity value, $Res Function(_MessageReactionEntity) _then) = __$MessageReactionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String messageId, ReactionType type, DateTime createdAt
});




}
/// @nodoc
class __$MessageReactionEntityCopyWithImpl<$Res>
    implements _$MessageReactionEntityCopyWith<$Res> {
  __$MessageReactionEntityCopyWithImpl(this._self, this._then);

  final _MessageReactionEntity _self;
  final $Res Function(_MessageReactionEntity) _then;

/// Create a copy of MessageReactionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? messageId = null,Object? type = null,Object? createdAt = null,}) {
  return _then(_MessageReactionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReactionType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

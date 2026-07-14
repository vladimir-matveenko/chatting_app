// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_reply_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageReplyEntity {

 String get id; String get senderId; MessageType get type; String? get body; DateTime? get deletedAt;
/// Create a copy of MessageReplyEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageReplyEntityCopyWith<MessageReplyEntity> get copyWith => _$MessageReplyEntityCopyWithImpl<MessageReplyEntity>(this as MessageReplyEntity, _$identity);

  /// Serializes this MessageReplyEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageReplyEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.type, type) || other.type == type)&&(identical(other.body, body) || other.body == body)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,type,body,deletedAt);

@override
String toString() {
  return 'MessageReplyEntity(id: $id, senderId: $senderId, type: $type, body: $body, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $MessageReplyEntityCopyWith<$Res>  {
  factory $MessageReplyEntityCopyWith(MessageReplyEntity value, $Res Function(MessageReplyEntity) _then) = _$MessageReplyEntityCopyWithImpl;
@useResult
$Res call({
 String id, String senderId, MessageType type, String? body, DateTime? deletedAt
});




}
/// @nodoc
class _$MessageReplyEntityCopyWithImpl<$Res>
    implements $MessageReplyEntityCopyWith<$Res> {
  _$MessageReplyEntityCopyWithImpl(this._self, this._then);

  final MessageReplyEntity _self;
  final $Res Function(MessageReplyEntity) _then;

/// Create a copy of MessageReplyEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? senderId = null,Object? type = null,Object? body = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageType,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageReplyEntity].
extension MessageReplyEntityPatterns on MessageReplyEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageReplyEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageReplyEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageReplyEntity value)  $default,){
final _that = this;
switch (_that) {
case _MessageReplyEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageReplyEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MessageReplyEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String senderId,  MessageType type,  String? body,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageReplyEntity() when $default != null:
return $default(_that.id,_that.senderId,_that.type,_that.body,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String senderId,  MessageType type,  String? body,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _MessageReplyEntity():
return $default(_that.id,_that.senderId,_that.type,_that.body,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String senderId,  MessageType type,  String? body,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _MessageReplyEntity() when $default != null:
return $default(_that.id,_that.senderId,_that.type,_that.body,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageReplyEntity implements MessageReplyEntity {
  const _MessageReplyEntity({required this.id, required this.senderId, required this.type, this.body, this.deletedAt});
  factory _MessageReplyEntity.fromJson(Map<String, dynamic> json) => _$MessageReplyEntityFromJson(json);

@override final  String id;
@override final  String senderId;
@override final  MessageType type;
@override final  String? body;
@override final  DateTime? deletedAt;

/// Create a copy of MessageReplyEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageReplyEntityCopyWith<_MessageReplyEntity> get copyWith => __$MessageReplyEntityCopyWithImpl<_MessageReplyEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageReplyEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageReplyEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.type, type) || other.type == type)&&(identical(other.body, body) || other.body == body)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,type,body,deletedAt);

@override
String toString() {
  return 'MessageReplyEntity(id: $id, senderId: $senderId, type: $type, body: $body, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$MessageReplyEntityCopyWith<$Res> implements $MessageReplyEntityCopyWith<$Res> {
  factory _$MessageReplyEntityCopyWith(_MessageReplyEntity value, $Res Function(_MessageReplyEntity) _then) = __$MessageReplyEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String senderId, MessageType type, String? body, DateTime? deletedAt
});




}
/// @nodoc
class __$MessageReplyEntityCopyWithImpl<$Res>
    implements _$MessageReplyEntityCopyWith<$Res> {
  __$MessageReplyEntityCopyWithImpl(this._self, this._then);

  final _MessageReplyEntity _self;
  final $Res Function(_MessageReplyEntity) _then;

/// Create a copy of MessageReplyEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? senderId = null,Object? type = null,Object? body = freezed,Object? deletedAt = freezed,}) {
  return _then(_MessageReplyEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageType,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

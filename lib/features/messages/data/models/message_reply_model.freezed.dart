// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_reply_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageReplyModel {

 String get id; String get senderId; MessageType get type; String? get body; DateTime? get deletedAt;
/// Create a copy of MessageReplyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageReplyModelCopyWith<MessageReplyModel> get copyWith => _$MessageReplyModelCopyWithImpl<MessageReplyModel>(this as MessageReplyModel, _$identity);

  /// Serializes this MessageReplyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageReplyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.type, type) || other.type == type)&&(identical(other.body, body) || other.body == body)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,type,body,deletedAt);

@override
String toString() {
  return 'MessageReplyModel(id: $id, senderId: $senderId, type: $type, body: $body, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $MessageReplyModelCopyWith<$Res>  {
  factory $MessageReplyModelCopyWith(MessageReplyModel value, $Res Function(MessageReplyModel) _then) = _$MessageReplyModelCopyWithImpl;
@useResult
$Res call({
 String id, String senderId, MessageType type, String? body, DateTime? deletedAt
});




}
/// @nodoc
class _$MessageReplyModelCopyWithImpl<$Res>
    implements $MessageReplyModelCopyWith<$Res> {
  _$MessageReplyModelCopyWithImpl(this._self, this._then);

  final MessageReplyModel _self;
  final $Res Function(MessageReplyModel) _then;

/// Create a copy of MessageReplyModel
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


/// Adds pattern-matching-related methods to [MessageReplyModel].
extension MessageReplyModelPatterns on MessageReplyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageReplyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageReplyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageReplyModel value)  $default,){
final _that = this;
switch (_that) {
case _MessageReplyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageReplyModel value)?  $default,){
final _that = this;
switch (_that) {
case _MessageReplyModel() when $default != null:
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
case _MessageReplyModel() when $default != null:
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
case _MessageReplyModel():
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
case _MessageReplyModel() when $default != null:
return $default(_that.id,_that.senderId,_that.type,_that.body,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageReplyModel implements MessageReplyModel {
  const _MessageReplyModel({required this.id, required this.senderId, required this.type, this.body, this.deletedAt});
  factory _MessageReplyModel.fromJson(Map<String, dynamic> json) => _$MessageReplyModelFromJson(json);

@override final  String id;
@override final  String senderId;
@override final  MessageType type;
@override final  String? body;
@override final  DateTime? deletedAt;

/// Create a copy of MessageReplyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageReplyModelCopyWith<_MessageReplyModel> get copyWith => __$MessageReplyModelCopyWithImpl<_MessageReplyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageReplyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageReplyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.type, type) || other.type == type)&&(identical(other.body, body) || other.body == body)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,type,body,deletedAt);

@override
String toString() {
  return 'MessageReplyModel(id: $id, senderId: $senderId, type: $type, body: $body, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$MessageReplyModelCopyWith<$Res> implements $MessageReplyModelCopyWith<$Res> {
  factory _$MessageReplyModelCopyWith(_MessageReplyModel value, $Res Function(_MessageReplyModel) _then) = __$MessageReplyModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String senderId, MessageType type, String? body, DateTime? deletedAt
});




}
/// @nodoc
class __$MessageReplyModelCopyWithImpl<$Res>
    implements _$MessageReplyModelCopyWith<$Res> {
  __$MessageReplyModelCopyWithImpl(this._self, this._then);

  final _MessageReplyModel _self;
  final $Res Function(_MessageReplyModel) _then;

/// Create a copy of MessageReplyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? senderId = null,Object? type = null,Object? body = freezed,Object? deletedAt = freezed,}) {
  return _then(_MessageReplyModel(
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

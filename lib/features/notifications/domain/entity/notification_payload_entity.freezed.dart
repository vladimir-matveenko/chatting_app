// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_payload_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationPayloadEntity {

 String? get chatId; String? get messageId; String? get senderId; String? get memberId;
/// Create a copy of NotificationPayloadEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPayloadEntityCopyWith<NotificationPayloadEntity> get copyWith => _$NotificationPayloadEntityCopyWithImpl<NotificationPayloadEntity>(this as NotificationPayloadEntity, _$identity);

  /// Serializes this NotificationPayloadEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPayloadEntity&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.memberId, memberId) || other.memberId == memberId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,messageId,senderId,memberId);

@override
String toString() {
  return 'NotificationPayloadEntity(chatId: $chatId, messageId: $messageId, senderId: $senderId, memberId: $memberId)';
}


}

/// @nodoc
abstract mixin class $NotificationPayloadEntityCopyWith<$Res>  {
  factory $NotificationPayloadEntityCopyWith(NotificationPayloadEntity value, $Res Function(NotificationPayloadEntity) _then) = _$NotificationPayloadEntityCopyWithImpl;
@useResult
$Res call({
 String? chatId, String? messageId, String? senderId, String? memberId
});




}
/// @nodoc
class _$NotificationPayloadEntityCopyWithImpl<$Res>
    implements $NotificationPayloadEntityCopyWith<$Res> {
  _$NotificationPayloadEntityCopyWithImpl(this._self, this._then);

  final NotificationPayloadEntity _self;
  final $Res Function(NotificationPayloadEntity) _then;

/// Create a copy of NotificationPayloadEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatId = freezed,Object? messageId = freezed,Object? senderId = freezed,Object? memberId = freezed,}) {
  return _then(_self.copyWith(
chatId: freezed == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String?,messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String?,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,memberId: freezed == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationPayloadEntity].
extension NotificationPayloadEntityPatterns on NotificationPayloadEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationPayloadEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationPayloadEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationPayloadEntity value)  $default,){
final _that = this;
switch (_that) {
case _NotificationPayloadEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationPayloadEntity value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationPayloadEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? chatId,  String? messageId,  String? senderId,  String? memberId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationPayloadEntity() when $default != null:
return $default(_that.chatId,_that.messageId,_that.senderId,_that.memberId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? chatId,  String? messageId,  String? senderId,  String? memberId)  $default,) {final _that = this;
switch (_that) {
case _NotificationPayloadEntity():
return $default(_that.chatId,_that.messageId,_that.senderId,_that.memberId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? chatId,  String? messageId,  String? senderId,  String? memberId)?  $default,) {final _that = this;
switch (_that) {
case _NotificationPayloadEntity() when $default != null:
return $default(_that.chatId,_that.messageId,_that.senderId,_that.memberId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationPayloadEntity implements NotificationPayloadEntity {
  const _NotificationPayloadEntity({this.chatId, this.messageId, this.senderId, this.memberId});
  factory _NotificationPayloadEntity.fromJson(Map<String, dynamic> json) => _$NotificationPayloadEntityFromJson(json);

@override final  String? chatId;
@override final  String? messageId;
@override final  String? senderId;
@override final  String? memberId;

/// Create a copy of NotificationPayloadEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationPayloadEntityCopyWith<_NotificationPayloadEntity> get copyWith => __$NotificationPayloadEntityCopyWithImpl<_NotificationPayloadEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationPayloadEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationPayloadEntity&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.memberId, memberId) || other.memberId == memberId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,messageId,senderId,memberId);

@override
String toString() {
  return 'NotificationPayloadEntity(chatId: $chatId, messageId: $messageId, senderId: $senderId, memberId: $memberId)';
}


}

/// @nodoc
abstract mixin class _$NotificationPayloadEntityCopyWith<$Res> implements $NotificationPayloadEntityCopyWith<$Res> {
  factory _$NotificationPayloadEntityCopyWith(_NotificationPayloadEntity value, $Res Function(_NotificationPayloadEntity) _then) = __$NotificationPayloadEntityCopyWithImpl;
@override @useResult
$Res call({
 String? chatId, String? messageId, String? senderId, String? memberId
});




}
/// @nodoc
class __$NotificationPayloadEntityCopyWithImpl<$Res>
    implements _$NotificationPayloadEntityCopyWith<$Res> {
  __$NotificationPayloadEntityCopyWithImpl(this._self, this._then);

  final _NotificationPayloadEntity _self;
  final $Res Function(_NotificationPayloadEntity) _then;

/// Create a copy of NotificationPayloadEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatId = freezed,Object? messageId = freezed,Object? senderId = freezed,Object? memberId = freezed,}) {
  return _then(_NotificationPayloadEntity(
chatId: freezed == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String?,messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String?,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,memberId: freezed == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

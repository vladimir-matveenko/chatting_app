// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_search_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageSearchResultModel {

 String get messageId; String get chatId; MessageSenderModel get sender; MessageType get type; String? get body; DateTime get createdAt;
/// Create a copy of MessageSearchResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageSearchResultModelCopyWith<MessageSearchResultModel> get copyWith => _$MessageSearchResultModelCopyWithImpl<MessageSearchResultModel>(this as MessageSearchResultModel, _$identity);

  /// Serializes this MessageSearchResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageSearchResultModel&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.type, type) || other.type == type)&&(identical(other.body, body) || other.body == body)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageId,chatId,sender,type,body,createdAt);

@override
String toString() {
  return 'MessageSearchResultModel(messageId: $messageId, chatId: $chatId, sender: $sender, type: $type, body: $body, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MessageSearchResultModelCopyWith<$Res>  {
  factory $MessageSearchResultModelCopyWith(MessageSearchResultModel value, $Res Function(MessageSearchResultModel) _then) = _$MessageSearchResultModelCopyWithImpl;
@useResult
$Res call({
 String messageId, String chatId, MessageSenderModel sender, MessageType type, String? body, DateTime createdAt
});


$MessageSenderModelCopyWith<$Res> get sender;

}
/// @nodoc
class _$MessageSearchResultModelCopyWithImpl<$Res>
    implements $MessageSearchResultModelCopyWith<$Res> {
  _$MessageSearchResultModelCopyWithImpl(this._self, this._then);

  final MessageSearchResultModel _self;
  final $Res Function(MessageSearchResultModel) _then;

/// Create a copy of MessageSearchResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messageId = null,Object? chatId = null,Object? sender = null,Object? type = null,Object? body = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as MessageSenderModel,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageType,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of MessageSearchResultModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageSenderModelCopyWith<$Res> get sender {
  
  return $MessageSenderModelCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}
}


/// Adds pattern-matching-related methods to [MessageSearchResultModel].
extension MessageSearchResultModelPatterns on MessageSearchResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageSearchResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageSearchResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageSearchResultModel value)  $default,){
final _that = this;
switch (_that) {
case _MessageSearchResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageSearchResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _MessageSearchResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String messageId,  String chatId,  MessageSenderModel sender,  MessageType type,  String? body,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageSearchResultModel() when $default != null:
return $default(_that.messageId,_that.chatId,_that.sender,_that.type,_that.body,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String messageId,  String chatId,  MessageSenderModel sender,  MessageType type,  String? body,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _MessageSearchResultModel():
return $default(_that.messageId,_that.chatId,_that.sender,_that.type,_that.body,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String messageId,  String chatId,  MessageSenderModel sender,  MessageType type,  String? body,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MessageSearchResultModel() when $default != null:
return $default(_that.messageId,_that.chatId,_that.sender,_that.type,_that.body,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageSearchResultModel extends MessageSearchResultModel {
  const _MessageSearchResultModel({required this.messageId, required this.chatId, required this.sender, required this.type, this.body, required this.createdAt}): super._();
  factory _MessageSearchResultModel.fromJson(Map<String, dynamic> json) => _$MessageSearchResultModelFromJson(json);

@override final  String messageId;
@override final  String chatId;
@override final  MessageSenderModel sender;
@override final  MessageType type;
@override final  String? body;
@override final  DateTime createdAt;

/// Create a copy of MessageSearchResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageSearchResultModelCopyWith<_MessageSearchResultModel> get copyWith => __$MessageSearchResultModelCopyWithImpl<_MessageSearchResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageSearchResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageSearchResultModel&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.type, type) || other.type == type)&&(identical(other.body, body) || other.body == body)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageId,chatId,sender,type,body,createdAt);

@override
String toString() {
  return 'MessageSearchResultModel(messageId: $messageId, chatId: $chatId, sender: $sender, type: $type, body: $body, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MessageSearchResultModelCopyWith<$Res> implements $MessageSearchResultModelCopyWith<$Res> {
  factory _$MessageSearchResultModelCopyWith(_MessageSearchResultModel value, $Res Function(_MessageSearchResultModel) _then) = __$MessageSearchResultModelCopyWithImpl;
@override @useResult
$Res call({
 String messageId, String chatId, MessageSenderModel sender, MessageType type, String? body, DateTime createdAt
});


@override $MessageSenderModelCopyWith<$Res> get sender;

}
/// @nodoc
class __$MessageSearchResultModelCopyWithImpl<$Res>
    implements _$MessageSearchResultModelCopyWith<$Res> {
  __$MessageSearchResultModelCopyWithImpl(this._self, this._then);

  final _MessageSearchResultModel _self;
  final $Res Function(_MessageSearchResultModel) _then;

/// Create a copy of MessageSearchResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messageId = null,Object? chatId = null,Object? sender = null,Object? type = null,Object? body = freezed,Object? createdAt = null,}) {
  return _then(_MessageSearchResultModel(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as MessageSenderModel,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageType,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of MessageSearchResultModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageSenderModelCopyWith<$Res> get sender {
  
  return $MessageSenderModelCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}
}

// dart format on

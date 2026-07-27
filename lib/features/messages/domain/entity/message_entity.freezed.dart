// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageEntity {

 int get id; String get chatId; MessageSenderEntity get sender; MessageType get type; String? get body; String? get replyToId; DateTime get createdAt; DateTime get updatedAt; DateTime? get deletedAt;@JsonKey(defaultValue: false) bool get isDeleted;@JsonKey(defaultValue: []) List<MessageReactionSummaryEntity> get reactions; ReactionType? get currentUserReaction; MessageReplyEntity? get reply; int get readCount;
/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageEntityCopyWith<MessageEntity> get copyWith => _$MessageEntityCopyWithImpl<MessageEntity>(this as MessageEntity, _$identity);

  /// Serializes this MessageEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.type, type) || other.type == type)&&(identical(other.body, body) || other.body == body)&&(identical(other.replyToId, replyToId) || other.replyToId == replyToId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&const DeepCollectionEquality().equals(other.reactions, reactions)&&(identical(other.currentUserReaction, currentUserReaction) || other.currentUserReaction == currentUserReaction)&&(identical(other.reply, reply) || other.reply == reply)&&(identical(other.readCount, readCount) || other.readCount == readCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chatId,sender,type,body,replyToId,createdAt,updatedAt,deletedAt,isDeleted,const DeepCollectionEquality().hash(reactions),currentUserReaction,reply,readCount);

@override
String toString() {
  return 'MessageEntity(id: $id, chatId: $chatId, sender: $sender, type: $type, body: $body, replyToId: $replyToId, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isDeleted: $isDeleted, reactions: $reactions, currentUserReaction: $currentUserReaction, reply: $reply, readCount: $readCount)';
}


}

/// @nodoc
abstract mixin class $MessageEntityCopyWith<$Res>  {
  factory $MessageEntityCopyWith(MessageEntity value, $Res Function(MessageEntity) _then) = _$MessageEntityCopyWithImpl;
@useResult
$Res call({
 int id, String chatId, MessageSenderEntity sender, MessageType type, String? body, String? replyToId, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt,@JsonKey(defaultValue: false) bool isDeleted,@JsonKey(defaultValue: []) List<MessageReactionSummaryEntity> reactions, ReactionType? currentUserReaction, MessageReplyEntity? reply, int readCount
});


$MessageSenderEntityCopyWith<$Res> get sender;$MessageReplyEntityCopyWith<$Res>? get reply;

}
/// @nodoc
class _$MessageEntityCopyWithImpl<$Res>
    implements $MessageEntityCopyWith<$Res> {
  _$MessageEntityCopyWithImpl(this._self, this._then);

  final MessageEntity _self;
  final $Res Function(MessageEntity) _then;

/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chatId = null,Object? sender = null,Object? type = null,Object? body = freezed,Object? replyToId = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? isDeleted = null,Object? reactions = null,Object? currentUserReaction = freezed,Object? reply = freezed,Object? readCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as MessageSenderEntity,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageType,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,replyToId: freezed == replyToId ? _self.replyToId : replyToId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,reactions: null == reactions ? _self.reactions : reactions // ignore: cast_nullable_to_non_nullable
as List<MessageReactionSummaryEntity>,currentUserReaction: freezed == currentUserReaction ? _self.currentUserReaction : currentUserReaction // ignore: cast_nullable_to_non_nullable
as ReactionType?,reply: freezed == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as MessageReplyEntity?,readCount: null == readCount ? _self.readCount : readCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageSenderEntityCopyWith<$Res> get sender {
  
  return $MessageSenderEntityCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageReplyEntityCopyWith<$Res>? get reply {
    if (_self.reply == null) {
    return null;
  }

  return $MessageReplyEntityCopyWith<$Res>(_self.reply!, (value) {
    return _then(_self.copyWith(reply: value));
  });
}
}


/// Adds pattern-matching-related methods to [MessageEntity].
extension MessageEntityPatterns on MessageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageEntity value)  $default,){
final _that = this;
switch (_that) {
case _MessageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MessageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String chatId,  MessageSenderEntity sender,  MessageType type,  String? body,  String? replyToId,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt, @JsonKey(defaultValue: false)  bool isDeleted, @JsonKey(defaultValue: [])  List<MessageReactionSummaryEntity> reactions,  ReactionType? currentUserReaction,  MessageReplyEntity? reply,  int readCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageEntity() when $default != null:
return $default(_that.id,_that.chatId,_that.sender,_that.type,_that.body,_that.replyToId,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isDeleted,_that.reactions,_that.currentUserReaction,_that.reply,_that.readCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String chatId,  MessageSenderEntity sender,  MessageType type,  String? body,  String? replyToId,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt, @JsonKey(defaultValue: false)  bool isDeleted, @JsonKey(defaultValue: [])  List<MessageReactionSummaryEntity> reactions,  ReactionType? currentUserReaction,  MessageReplyEntity? reply,  int readCount)  $default,) {final _that = this;
switch (_that) {
case _MessageEntity():
return $default(_that.id,_that.chatId,_that.sender,_that.type,_that.body,_that.replyToId,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isDeleted,_that.reactions,_that.currentUserReaction,_that.reply,_that.readCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String chatId,  MessageSenderEntity sender,  MessageType type,  String? body,  String? replyToId,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt, @JsonKey(defaultValue: false)  bool isDeleted, @JsonKey(defaultValue: [])  List<MessageReactionSummaryEntity> reactions,  ReactionType? currentUserReaction,  MessageReplyEntity? reply,  int readCount)?  $default,) {final _that = this;
switch (_that) {
case _MessageEntity() when $default != null:
return $default(_that.id,_that.chatId,_that.sender,_that.type,_that.body,_that.replyToId,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isDeleted,_that.reactions,_that.currentUserReaction,_that.reply,_that.readCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageEntity implements MessageEntity {
  const _MessageEntity({required this.id, required this.chatId, required this.sender, required this.type, this.body, this.replyToId, required this.createdAt, required this.updatedAt, this.deletedAt, @JsonKey(defaultValue: false) required this.isDeleted, @JsonKey(defaultValue: []) required final  List<MessageReactionSummaryEntity> reactions, this.currentUserReaction, this.reply, required this.readCount}): _reactions = reactions;
  factory _MessageEntity.fromJson(Map<String, dynamic> json) => _$MessageEntityFromJson(json);

@override final  int id;
@override final  String chatId;
@override final  MessageSenderEntity sender;
@override final  MessageType type;
@override final  String? body;
@override final  String? replyToId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? deletedAt;
@override@JsonKey(defaultValue: false) final  bool isDeleted;
 final  List<MessageReactionSummaryEntity> _reactions;
@override@JsonKey(defaultValue: []) List<MessageReactionSummaryEntity> get reactions {
  if (_reactions is EqualUnmodifiableListView) return _reactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reactions);
}

@override final  ReactionType? currentUserReaction;
@override final  MessageReplyEntity? reply;
@override final  int readCount;

/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageEntityCopyWith<_MessageEntity> get copyWith => __$MessageEntityCopyWithImpl<_MessageEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.type, type) || other.type == type)&&(identical(other.body, body) || other.body == body)&&(identical(other.replyToId, replyToId) || other.replyToId == replyToId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&const DeepCollectionEquality().equals(other._reactions, _reactions)&&(identical(other.currentUserReaction, currentUserReaction) || other.currentUserReaction == currentUserReaction)&&(identical(other.reply, reply) || other.reply == reply)&&(identical(other.readCount, readCount) || other.readCount == readCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chatId,sender,type,body,replyToId,createdAt,updatedAt,deletedAt,isDeleted,const DeepCollectionEquality().hash(_reactions),currentUserReaction,reply,readCount);

@override
String toString() {
  return 'MessageEntity(id: $id, chatId: $chatId, sender: $sender, type: $type, body: $body, replyToId: $replyToId, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isDeleted: $isDeleted, reactions: $reactions, currentUserReaction: $currentUserReaction, reply: $reply, readCount: $readCount)';
}


}

/// @nodoc
abstract mixin class _$MessageEntityCopyWith<$Res> implements $MessageEntityCopyWith<$Res> {
  factory _$MessageEntityCopyWith(_MessageEntity value, $Res Function(_MessageEntity) _then) = __$MessageEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String chatId, MessageSenderEntity sender, MessageType type, String? body, String? replyToId, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt,@JsonKey(defaultValue: false) bool isDeleted,@JsonKey(defaultValue: []) List<MessageReactionSummaryEntity> reactions, ReactionType? currentUserReaction, MessageReplyEntity? reply, int readCount
});


@override $MessageSenderEntityCopyWith<$Res> get sender;@override $MessageReplyEntityCopyWith<$Res>? get reply;

}
/// @nodoc
class __$MessageEntityCopyWithImpl<$Res>
    implements _$MessageEntityCopyWith<$Res> {
  __$MessageEntityCopyWithImpl(this._self, this._then);

  final _MessageEntity _self;
  final $Res Function(_MessageEntity) _then;

/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chatId = null,Object? sender = null,Object? type = null,Object? body = freezed,Object? replyToId = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? isDeleted = null,Object? reactions = null,Object? currentUserReaction = freezed,Object? reply = freezed,Object? readCount = null,}) {
  return _then(_MessageEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as MessageSenderEntity,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageType,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,replyToId: freezed == replyToId ? _self.replyToId : replyToId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,reactions: null == reactions ? _self._reactions : reactions // ignore: cast_nullable_to_non_nullable
as List<MessageReactionSummaryEntity>,currentUserReaction: freezed == currentUserReaction ? _self.currentUserReaction : currentUserReaction // ignore: cast_nullable_to_non_nullable
as ReactionType?,reply: freezed == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as MessageReplyEntity?,readCount: null == readCount ? _self.readCount : readCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageSenderEntityCopyWith<$Res> get sender {
  
  return $MessageSenderEntityCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageReplyEntityCopyWith<$Res>? get reply {
    if (_self.reply == null) {
    return null;
  }

  return $MessageReplyEntityCopyWith<$Res>(_self.reply!, (value) {
    return _then(_self.copyWith(reply: value));
  });
}
}

// dart format on

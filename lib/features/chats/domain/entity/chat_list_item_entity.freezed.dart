// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_list_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatListItemEntity {

 String get id; ChatType get type; String? get title; String? get avatarUrl; String? get ownerId; DateTime get createdAt; DateTime get updatedAt; String? get lastMessagePreview; DateTime? get lastMessageAt; int get unreadCount; List<ChatListParticipantModel> get participants; int get participantsCount;
/// Create a copy of ChatListItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatListItemEntityCopyWith<ChatListItemEntity> get copyWith => _$ChatListItemEntityCopyWithImpl<ChatListItemEntity>(this as ChatListItemEntity, _$identity);

  /// Serializes this ChatListItemEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatListItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.participantsCount, participantsCount) || other.participantsCount == participantsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,avatarUrl,ownerId,createdAt,updatedAt,lastMessagePreview,lastMessageAt,unreadCount,const DeepCollectionEquality().hash(participants),participantsCount);

@override
String toString() {
  return 'ChatListItemEntity(id: $id, type: $type, title: $title, avatarUrl: $avatarUrl, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, lastMessagePreview: $lastMessagePreview, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount, participants: $participants, participantsCount: $participantsCount)';
}


}

/// @nodoc
abstract mixin class $ChatListItemEntityCopyWith<$Res>  {
  factory $ChatListItemEntityCopyWith(ChatListItemEntity value, $Res Function(ChatListItemEntity) _then) = _$ChatListItemEntityCopyWithImpl;
@useResult
$Res call({
 String id, ChatType type, String? title, String? avatarUrl, String? ownerId, DateTime createdAt, DateTime updatedAt, String? lastMessagePreview, DateTime? lastMessageAt, int unreadCount, List<ChatListParticipantModel> participants, int participantsCount
});




}
/// @nodoc
class _$ChatListItemEntityCopyWithImpl<$Res>
    implements $ChatListItemEntityCopyWith<$Res> {
  _$ChatListItemEntityCopyWithImpl(this._self, this._then);

  final ChatListItemEntity _self;
  final $Res Function(ChatListItemEntity) _then;

/// Create a copy of ChatListItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = freezed,Object? avatarUrl = freezed,Object? ownerId = freezed,Object? createdAt = null,Object? updatedAt = null,Object? lastMessagePreview = freezed,Object? lastMessageAt = freezed,Object? unreadCount = null,Object? participants = null,Object? participantsCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChatType,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,ownerId: freezed == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastMessagePreview: freezed == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<ChatListParticipantModel>,participantsCount: null == participantsCount ? _self.participantsCount : participantsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatListItemEntity].
extension ChatListItemEntityPatterns on ChatListItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatListItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatListItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatListItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _ChatListItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatListItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ChatListItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ChatType type,  String? title,  String? avatarUrl,  String? ownerId,  DateTime createdAt,  DateTime updatedAt,  String? lastMessagePreview,  DateTime? lastMessageAt,  int unreadCount,  List<ChatListParticipantModel> participants,  int participantsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatListItemEntity() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.avatarUrl,_that.ownerId,_that.createdAt,_that.updatedAt,_that.lastMessagePreview,_that.lastMessageAt,_that.unreadCount,_that.participants,_that.participantsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ChatType type,  String? title,  String? avatarUrl,  String? ownerId,  DateTime createdAt,  DateTime updatedAt,  String? lastMessagePreview,  DateTime? lastMessageAt,  int unreadCount,  List<ChatListParticipantModel> participants,  int participantsCount)  $default,) {final _that = this;
switch (_that) {
case _ChatListItemEntity():
return $default(_that.id,_that.type,_that.title,_that.avatarUrl,_that.ownerId,_that.createdAt,_that.updatedAt,_that.lastMessagePreview,_that.lastMessageAt,_that.unreadCount,_that.participants,_that.participantsCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ChatType type,  String? title,  String? avatarUrl,  String? ownerId,  DateTime createdAt,  DateTime updatedAt,  String? lastMessagePreview,  DateTime? lastMessageAt,  int unreadCount,  List<ChatListParticipantModel> participants,  int participantsCount)?  $default,) {final _that = this;
switch (_that) {
case _ChatListItemEntity() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.avatarUrl,_that.ownerId,_that.createdAt,_that.updatedAt,_that.lastMessagePreview,_that.lastMessageAt,_that.unreadCount,_that.participants,_that.participantsCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatListItemEntity implements ChatListItemEntity {
  const _ChatListItemEntity({required this.id, required this.type, this.title, this.avatarUrl, this.ownerId, required this.createdAt, required this.updatedAt, this.lastMessagePreview, this.lastMessageAt, required this.unreadCount, required final  List<ChatListParticipantModel> participants, required this.participantsCount}): _participants = participants;
  factory _ChatListItemEntity.fromJson(Map<String, dynamic> json) => _$ChatListItemEntityFromJson(json);

@override final  String id;
@override final  ChatType type;
@override final  String? title;
@override final  String? avatarUrl;
@override final  String? ownerId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? lastMessagePreview;
@override final  DateTime? lastMessageAt;
@override final  int unreadCount;
 final  List<ChatListParticipantModel> _participants;
@override List<ChatListParticipantModel> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override final  int participantsCount;

/// Create a copy of ChatListItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatListItemEntityCopyWith<_ChatListItemEntity> get copyWith => __$ChatListItemEntityCopyWithImpl<_ChatListItemEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatListItemEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatListItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.participantsCount, participantsCount) || other.participantsCount == participantsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,avatarUrl,ownerId,createdAt,updatedAt,lastMessagePreview,lastMessageAt,unreadCount,const DeepCollectionEquality().hash(_participants),participantsCount);

@override
String toString() {
  return 'ChatListItemEntity(id: $id, type: $type, title: $title, avatarUrl: $avatarUrl, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, lastMessagePreview: $lastMessagePreview, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount, participants: $participants, participantsCount: $participantsCount)';
}


}

/// @nodoc
abstract mixin class _$ChatListItemEntityCopyWith<$Res> implements $ChatListItemEntityCopyWith<$Res> {
  factory _$ChatListItemEntityCopyWith(_ChatListItemEntity value, $Res Function(_ChatListItemEntity) _then) = __$ChatListItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, ChatType type, String? title, String? avatarUrl, String? ownerId, DateTime createdAt, DateTime updatedAt, String? lastMessagePreview, DateTime? lastMessageAt, int unreadCount, List<ChatListParticipantModel> participants, int participantsCount
});




}
/// @nodoc
class __$ChatListItemEntityCopyWithImpl<$Res>
    implements _$ChatListItemEntityCopyWith<$Res> {
  __$ChatListItemEntityCopyWithImpl(this._self, this._then);

  final _ChatListItemEntity _self;
  final $Res Function(_ChatListItemEntity) _then;

/// Create a copy of ChatListItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = freezed,Object? avatarUrl = freezed,Object? ownerId = freezed,Object? createdAt = null,Object? updatedAt = null,Object? lastMessagePreview = freezed,Object? lastMessageAt = freezed,Object? unreadCount = null,Object? participants = null,Object? participantsCount = null,}) {
  return _then(_ChatListItemEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChatType,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,ownerId: freezed == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastMessagePreview: freezed == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<ChatListParticipantModel>,participantsCount: null == participantsCount ? _self.participantsCount : participantsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

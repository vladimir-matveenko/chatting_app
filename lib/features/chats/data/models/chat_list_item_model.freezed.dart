// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatListItemModel {

 String get id; ChatType get type; String? get title; String? get avatarUrl; String? get ownerId; DateTime get createdAt; DateTime get updatedAt; String? get lastMessagePreview; DateTime? get lastMessageAt; int get unreadCount; List<ChatListParticipantModel> get participants; int get participantsCount;
/// Create a copy of ChatListItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatListItemModelCopyWith<ChatListItemModel> get copyWith => _$ChatListItemModelCopyWithImpl<ChatListItemModel>(this as ChatListItemModel, _$identity);

  /// Serializes this ChatListItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.participantsCount, participantsCount) || other.participantsCount == participantsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,avatarUrl,ownerId,createdAt,updatedAt,lastMessagePreview,lastMessageAt,unreadCount,const DeepCollectionEquality().hash(participants),participantsCount);

@override
String toString() {
  return 'ChatListItemModel(id: $id, type: $type, title: $title, avatarUrl: $avatarUrl, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, lastMessagePreview: $lastMessagePreview, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount, participants: $participants, participantsCount: $participantsCount)';
}


}

/// @nodoc
abstract mixin class $ChatListItemModelCopyWith<$Res>  {
  factory $ChatListItemModelCopyWith(ChatListItemModel value, $Res Function(ChatListItemModel) _then) = _$ChatListItemModelCopyWithImpl;
@useResult
$Res call({
 String id, ChatType type, String? title, String? avatarUrl, String? ownerId, DateTime createdAt, DateTime updatedAt, String? lastMessagePreview, DateTime? lastMessageAt, int unreadCount, List<ChatListParticipantModel> participants, int participantsCount
});




}
/// @nodoc
class _$ChatListItemModelCopyWithImpl<$Res>
    implements $ChatListItemModelCopyWith<$Res> {
  _$ChatListItemModelCopyWithImpl(this._self, this._then);

  final ChatListItemModel _self;
  final $Res Function(ChatListItemModel) _then;

/// Create a copy of ChatListItemModel
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


/// Adds pattern-matching-related methods to [ChatListItemModel].
extension ChatListItemModelPatterns on ChatListItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatListItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatListItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatListItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatListItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatListItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatListItemModel() when $default != null:
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
case _ChatListItemModel() when $default != null:
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
case _ChatListItemModel():
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
case _ChatListItemModel() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.avatarUrl,_that.ownerId,_that.createdAt,_that.updatedAt,_that.lastMessagePreview,_that.lastMessageAt,_that.unreadCount,_that.participants,_that.participantsCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatListItemModel extends ChatListItemModel {
  const _ChatListItemModel({required this.id, required this.type, this.title, this.avatarUrl, this.ownerId, required this.createdAt, required this.updatedAt, this.lastMessagePreview, this.lastMessageAt, required this.unreadCount, required final  List<ChatListParticipantModel> participants, required this.participantsCount}): _participants = participants,super._();
  factory _ChatListItemModel.fromJson(Map<String, dynamic> json) => _$ChatListItemModelFromJson(json);

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

/// Create a copy of ChatListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatListItemModelCopyWith<_ChatListItemModel> get copyWith => __$ChatListItemModelCopyWithImpl<_ChatListItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatListItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.participantsCount, participantsCount) || other.participantsCount == participantsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,avatarUrl,ownerId,createdAt,updatedAt,lastMessagePreview,lastMessageAt,unreadCount,const DeepCollectionEquality().hash(_participants),participantsCount);

@override
String toString() {
  return 'ChatListItemModel(id: $id, type: $type, title: $title, avatarUrl: $avatarUrl, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, lastMessagePreview: $lastMessagePreview, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount, participants: $participants, participantsCount: $participantsCount)';
}


}

/// @nodoc
abstract mixin class _$ChatListItemModelCopyWith<$Res> implements $ChatListItemModelCopyWith<$Res> {
  factory _$ChatListItemModelCopyWith(_ChatListItemModel value, $Res Function(_ChatListItemModel) _then) = __$ChatListItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, ChatType type, String? title, String? avatarUrl, String? ownerId, DateTime createdAt, DateTime updatedAt, String? lastMessagePreview, DateTime? lastMessageAt, int unreadCount, List<ChatListParticipantModel> participants, int participantsCount
});




}
/// @nodoc
class __$ChatListItemModelCopyWithImpl<$Res>
    implements _$ChatListItemModelCopyWith<$Res> {
  __$ChatListItemModelCopyWithImpl(this._self, this._then);

  final _ChatListItemModel _self;
  final $Res Function(_ChatListItemModel) _then;

/// Create a copy of ChatListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = freezed,Object? avatarUrl = freezed,Object? ownerId = freezed,Object? createdAt = null,Object? updatedAt = null,Object? lastMessagePreview = freezed,Object? lastMessageAt = freezed,Object? unreadCount = null,Object? participants = null,Object? participantsCount = null,}) {
  return _then(_ChatListItemModel(
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

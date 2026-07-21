// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_member_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMemberModel {

 String get chatId; String get userId; ChatMemberRole get role; DateTime get joinedAt; String? get lastReadMessageId; bool get isMuted; bool get isArchived; String? get displayName; String get userName; String? get avatarUrl;
/// Create a copy of ChatMemberModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMemberModelCopyWith<ChatMemberModel> get copyWith => _$ChatMemberModelCopyWithImpl<ChatMemberModel>(this as ChatMemberModel, _$identity);

  /// Serializes this ChatMemberModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMemberModel&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.lastReadMessageId, lastReadMessageId) || other.lastReadMessageId == lastReadMessageId)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,userId,role,joinedAt,lastReadMessageId,isMuted,isArchived,displayName,userName,avatarUrl);

@override
String toString() {
  return 'ChatMemberModel(chatId: $chatId, userId: $userId, role: $role, joinedAt: $joinedAt, lastReadMessageId: $lastReadMessageId, isMuted: $isMuted, isArchived: $isArchived, displayName: $displayName, userName: $userName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $ChatMemberModelCopyWith<$Res>  {
  factory $ChatMemberModelCopyWith(ChatMemberModel value, $Res Function(ChatMemberModel) _then) = _$ChatMemberModelCopyWithImpl;
@useResult
$Res call({
 String chatId, String userId, ChatMemberRole role, DateTime joinedAt, String? lastReadMessageId, bool isMuted, bool isArchived, String? displayName, String userName, String? avatarUrl
});




}
/// @nodoc
class _$ChatMemberModelCopyWithImpl<$Res>
    implements $ChatMemberModelCopyWith<$Res> {
  _$ChatMemberModelCopyWithImpl(this._self, this._then);

  final ChatMemberModel _self;
  final $Res Function(ChatMemberModel) _then;

/// Create a copy of ChatMemberModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatId = null,Object? userId = null,Object? role = null,Object? joinedAt = null,Object? lastReadMessageId = freezed,Object? isMuted = null,Object? isArchived = null,Object? displayName = freezed,Object? userName = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatMemberRole,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastReadMessageId: freezed == lastReadMessageId ? _self.lastReadMessageId : lastReadMessageId // ignore: cast_nullable_to_non_nullable
as String?,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMemberModel].
extension ChatMemberModelPatterns on ChatMemberModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMemberModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMemberModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMemberModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatMemberModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMemberModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMemberModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String chatId,  String userId,  ChatMemberRole role,  DateTime joinedAt,  String? lastReadMessageId,  bool isMuted,  bool isArchived,  String? displayName,  String userName,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMemberModel() when $default != null:
return $default(_that.chatId,_that.userId,_that.role,_that.joinedAt,_that.lastReadMessageId,_that.isMuted,_that.isArchived,_that.displayName,_that.userName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String chatId,  String userId,  ChatMemberRole role,  DateTime joinedAt,  String? lastReadMessageId,  bool isMuted,  bool isArchived,  String? displayName,  String userName,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _ChatMemberModel():
return $default(_that.chatId,_that.userId,_that.role,_that.joinedAt,_that.lastReadMessageId,_that.isMuted,_that.isArchived,_that.displayName,_that.userName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String chatId,  String userId,  ChatMemberRole role,  DateTime joinedAt,  String? lastReadMessageId,  bool isMuted,  bool isArchived,  String? displayName,  String userName,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _ChatMemberModel() when $default != null:
return $default(_that.chatId,_that.userId,_that.role,_that.joinedAt,_that.lastReadMessageId,_that.isMuted,_that.isArchived,_that.displayName,_that.userName,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMemberModel implements ChatMemberModel {
  const _ChatMemberModel({required this.chatId, required this.userId, required this.role, required this.joinedAt, this.lastReadMessageId, required this.isMuted, required this.isArchived, this.displayName, required this.userName, this.avatarUrl});
  factory _ChatMemberModel.fromJson(Map<String, dynamic> json) => _$ChatMemberModelFromJson(json);

@override final  String chatId;
@override final  String userId;
@override final  ChatMemberRole role;
@override final  DateTime joinedAt;
@override final  String? lastReadMessageId;
@override final  bool isMuted;
@override final  bool isArchived;
@override final  String? displayName;
@override final  String userName;
@override final  String? avatarUrl;

/// Create a copy of ChatMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMemberModelCopyWith<_ChatMemberModel> get copyWith => __$ChatMemberModelCopyWithImpl<_ChatMemberModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMemberModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMemberModel&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.lastReadMessageId, lastReadMessageId) || other.lastReadMessageId == lastReadMessageId)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,userId,role,joinedAt,lastReadMessageId,isMuted,isArchived,displayName,userName,avatarUrl);

@override
String toString() {
  return 'ChatMemberModel(chatId: $chatId, userId: $userId, role: $role, joinedAt: $joinedAt, lastReadMessageId: $lastReadMessageId, isMuted: $isMuted, isArchived: $isArchived, displayName: $displayName, userName: $userName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$ChatMemberModelCopyWith<$Res> implements $ChatMemberModelCopyWith<$Res> {
  factory _$ChatMemberModelCopyWith(_ChatMemberModel value, $Res Function(_ChatMemberModel) _then) = __$ChatMemberModelCopyWithImpl;
@override @useResult
$Res call({
 String chatId, String userId, ChatMemberRole role, DateTime joinedAt, String? lastReadMessageId, bool isMuted, bool isArchived, String? displayName, String userName, String? avatarUrl
});




}
/// @nodoc
class __$ChatMemberModelCopyWithImpl<$Res>
    implements _$ChatMemberModelCopyWith<$Res> {
  __$ChatMemberModelCopyWithImpl(this._self, this._then);

  final _ChatMemberModel _self;
  final $Res Function(_ChatMemberModel) _then;

/// Create a copy of ChatMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatId = null,Object? userId = null,Object? role = null,Object? joinedAt = null,Object? lastReadMessageId = freezed,Object? isMuted = null,Object? isArchived = null,Object? displayName = freezed,Object? userName = null,Object? avatarUrl = freezed,}) {
  return _then(_ChatMemberModel(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatMemberRole,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastReadMessageId: freezed == lastReadMessageId ? _self.lastReadMessageId : lastReadMessageId // ignore: cast_nullable_to_non_nullable
as String?,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

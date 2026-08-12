// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatState {

 ChatEntity? get chat; List<ChatMemberEntity> get chatMembers; List<UserListItemEntity> get selectedParticipants; String? get error; bool get isLoading; bool get shouldNavigate; bool get closeModal; CreateGroupStatus get status; TypingUserEntity? get typingUserEntity;
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateCopyWith<ChatState> get copyWith => _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState&&(identical(other.chat, chat) || other.chat == chat)&&const DeepCollectionEquality().equals(other.chatMembers, chatMembers)&&const DeepCollectionEquality().equals(other.selectedParticipants, selectedParticipants)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.shouldNavigate, shouldNavigate) || other.shouldNavigate == shouldNavigate)&&(identical(other.closeModal, closeModal) || other.closeModal == closeModal)&&(identical(other.status, status) || other.status == status)&&(identical(other.typingUserEntity, typingUserEntity) || other.typingUserEntity == typingUserEntity));
}


@override
int get hashCode => Object.hash(runtimeType,chat,const DeepCollectionEquality().hash(chatMembers),const DeepCollectionEquality().hash(selectedParticipants),error,isLoading,shouldNavigate,closeModal,status,typingUserEntity);

@override
String toString() {
  return 'ChatState(chat: $chat, chatMembers: $chatMembers, selectedParticipants: $selectedParticipants, error: $error, isLoading: $isLoading, shouldNavigate: $shouldNavigate, closeModal: $closeModal, status: $status, typingUserEntity: $typingUserEntity)';
}


}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res>  {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) = _$ChatStateCopyWithImpl;
@useResult
$Res call({
 ChatEntity? chat, List<ChatMemberEntity> chatMembers, List<UserListItemEntity> selectedParticipants, String? error, bool isLoading, bool shouldNavigate, bool closeModal, CreateGroupStatus status, TypingUserEntity? typingUserEntity
});


$ChatEntityCopyWith<$Res>? get chat;

}
/// @nodoc
class _$ChatStateCopyWithImpl<$Res>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chat = freezed,Object? chatMembers = null,Object? selectedParticipants = null,Object? error = freezed,Object? isLoading = null,Object? shouldNavigate = null,Object? closeModal = null,Object? status = null,Object? typingUserEntity = freezed,}) {
  return _then(_self.copyWith(
chat: freezed == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as ChatEntity?,chatMembers: null == chatMembers ? _self.chatMembers : chatMembers // ignore: cast_nullable_to_non_nullable
as List<ChatMemberEntity>,selectedParticipants: null == selectedParticipants ? _self.selectedParticipants : selectedParticipants // ignore: cast_nullable_to_non_nullable
as List<UserListItemEntity>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,shouldNavigate: null == shouldNavigate ? _self.shouldNavigate : shouldNavigate // ignore: cast_nullable_to_non_nullable
as bool,closeModal: null == closeModal ? _self.closeModal : closeModal // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateGroupStatus,typingUserEntity: freezed == typingUserEntity ? _self.typingUserEntity : typingUserEntity // ignore: cast_nullable_to_non_nullable
as TypingUserEntity?,
  ));
}
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatEntityCopyWith<$Res>? get chat {
    if (_self.chat == null) {
    return null;
  }

  return $ChatEntityCopyWith<$Res>(_self.chat!, (value) {
    return _then(_self.copyWith(chat: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatState value)  $default,){
final _that = this;
switch (_that) {
case _ChatState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChatEntity? chat,  List<ChatMemberEntity> chatMembers,  List<UserListItemEntity> selectedParticipants,  String? error,  bool isLoading,  bool shouldNavigate,  bool closeModal,  CreateGroupStatus status,  TypingUserEntity? typingUserEntity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.chat,_that.chatMembers,_that.selectedParticipants,_that.error,_that.isLoading,_that.shouldNavigate,_that.closeModal,_that.status,_that.typingUserEntity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChatEntity? chat,  List<ChatMemberEntity> chatMembers,  List<UserListItemEntity> selectedParticipants,  String? error,  bool isLoading,  bool shouldNavigate,  bool closeModal,  CreateGroupStatus status,  TypingUserEntity? typingUserEntity)  $default,) {final _that = this;
switch (_that) {
case _ChatState():
return $default(_that.chat,_that.chatMembers,_that.selectedParticipants,_that.error,_that.isLoading,_that.shouldNavigate,_that.closeModal,_that.status,_that.typingUserEntity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChatEntity? chat,  List<ChatMemberEntity> chatMembers,  List<UserListItemEntity> selectedParticipants,  String? error,  bool isLoading,  bool shouldNavigate,  bool closeModal,  CreateGroupStatus status,  TypingUserEntity? typingUserEntity)?  $default,) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.chat,_that.chatMembers,_that.selectedParticipants,_that.error,_that.isLoading,_that.shouldNavigate,_that.closeModal,_that.status,_that.typingUserEntity);case _:
  return null;

}
}

}

/// @nodoc


class _ChatState implements ChatState {
  const _ChatState({this.chat, final  List<ChatMemberEntity> chatMembers = const [], final  List<UserListItemEntity> selectedParticipants = const [], this.error, this.isLoading = false, this.shouldNavigate = false, this.closeModal = false, this.status = CreateGroupStatus.initial, this.typingUserEntity}): _chatMembers = chatMembers,_selectedParticipants = selectedParticipants;
  

@override final  ChatEntity? chat;
 final  List<ChatMemberEntity> _chatMembers;
@override@JsonKey() List<ChatMemberEntity> get chatMembers {
  if (_chatMembers is EqualUnmodifiableListView) return _chatMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chatMembers);
}

 final  List<UserListItemEntity> _selectedParticipants;
@override@JsonKey() List<UserListItemEntity> get selectedParticipants {
  if (_selectedParticipants is EqualUnmodifiableListView) return _selectedParticipants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedParticipants);
}

@override final  String? error;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool shouldNavigate;
@override@JsonKey() final  bool closeModal;
@override@JsonKey() final  CreateGroupStatus status;
@override final  TypingUserEntity? typingUserEntity;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatStateCopyWith<_ChatState> get copyWith => __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatState&&(identical(other.chat, chat) || other.chat == chat)&&const DeepCollectionEquality().equals(other._chatMembers, _chatMembers)&&const DeepCollectionEquality().equals(other._selectedParticipants, _selectedParticipants)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.shouldNavigate, shouldNavigate) || other.shouldNavigate == shouldNavigate)&&(identical(other.closeModal, closeModal) || other.closeModal == closeModal)&&(identical(other.status, status) || other.status == status)&&(identical(other.typingUserEntity, typingUserEntity) || other.typingUserEntity == typingUserEntity));
}


@override
int get hashCode => Object.hash(runtimeType,chat,const DeepCollectionEquality().hash(_chatMembers),const DeepCollectionEquality().hash(_selectedParticipants),error,isLoading,shouldNavigate,closeModal,status,typingUserEntity);

@override
String toString() {
  return 'ChatState(chat: $chat, chatMembers: $chatMembers, selectedParticipants: $selectedParticipants, error: $error, isLoading: $isLoading, shouldNavigate: $shouldNavigate, closeModal: $closeModal, status: $status, typingUserEntity: $typingUserEntity)';
}


}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(_ChatState value, $Res Function(_ChatState) _then) = __$ChatStateCopyWithImpl;
@override @useResult
$Res call({
 ChatEntity? chat, List<ChatMemberEntity> chatMembers, List<UserListItemEntity> selectedParticipants, String? error, bool isLoading, bool shouldNavigate, bool closeModal, CreateGroupStatus status, TypingUserEntity? typingUserEntity
});


@override $ChatEntityCopyWith<$Res>? get chat;

}
/// @nodoc
class __$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chat = freezed,Object? chatMembers = null,Object? selectedParticipants = null,Object? error = freezed,Object? isLoading = null,Object? shouldNavigate = null,Object? closeModal = null,Object? status = null,Object? typingUserEntity = freezed,}) {
  return _then(_ChatState(
chat: freezed == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as ChatEntity?,chatMembers: null == chatMembers ? _self._chatMembers : chatMembers // ignore: cast_nullable_to_non_nullable
as List<ChatMemberEntity>,selectedParticipants: null == selectedParticipants ? _self._selectedParticipants : selectedParticipants // ignore: cast_nullable_to_non_nullable
as List<UserListItemEntity>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,shouldNavigate: null == shouldNavigate ? _self.shouldNavigate : shouldNavigate // ignore: cast_nullable_to_non_nullable
as bool,closeModal: null == closeModal ? _self.closeModal : closeModal // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateGroupStatus,typingUserEntity: freezed == typingUserEntity ? _self.typingUserEntity : typingUserEntity // ignore: cast_nullable_to_non_nullable
as TypingUserEntity?,
  ));
}

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatEntityCopyWith<$Res>? get chat {
    if (_self.chat == null) {
    return null;
  }

  return $ChatEntityCopyWith<$Res>(_self.chat!, (value) {
    return _then(_self.copyWith(chat: value));
  });
}
}

// dart format on

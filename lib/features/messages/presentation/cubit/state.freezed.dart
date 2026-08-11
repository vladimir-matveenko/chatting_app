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
mixin _$MessagesState {

 List<MessageEntity> get pinnedMessages; List<MessageSearchResultEntity> get searchResults; MessagesPageEntity? get messagesPageEntity; String? get error; MessageEntity? get selectedMessage; int? get highlightedMessageIndex; int? get highlightedMessageId; bool get showMenu; bool get isLoading; bool get showNewerLoader; bool get showOlderLoader; bool get editModeActive; bool get replyModeActive; bool get closeModal; bool get shouldScroll; MessagesListStatus get status;
/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessagesStateCopyWith<MessagesState> get copyWith => _$MessagesStateCopyWithImpl<MessagesState>(this as MessagesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagesState&&const DeepCollectionEquality().equals(other.pinnedMessages, pinnedMessages)&&const DeepCollectionEquality().equals(other.searchResults, searchResults)&&(identical(other.messagesPageEntity, messagesPageEntity) || other.messagesPageEntity == messagesPageEntity)&&(identical(other.error, error) || other.error == error)&&(identical(other.selectedMessage, selectedMessage) || other.selectedMessage == selectedMessage)&&(identical(other.highlightedMessageIndex, highlightedMessageIndex) || other.highlightedMessageIndex == highlightedMessageIndex)&&(identical(other.highlightedMessageId, highlightedMessageId) || other.highlightedMessageId == highlightedMessageId)&&(identical(other.showMenu, showMenu) || other.showMenu == showMenu)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.showNewerLoader, showNewerLoader) || other.showNewerLoader == showNewerLoader)&&(identical(other.showOlderLoader, showOlderLoader) || other.showOlderLoader == showOlderLoader)&&(identical(other.editModeActive, editModeActive) || other.editModeActive == editModeActive)&&(identical(other.replyModeActive, replyModeActive) || other.replyModeActive == replyModeActive)&&(identical(other.closeModal, closeModal) || other.closeModal == closeModal)&&(identical(other.shouldScroll, shouldScroll) || other.shouldScroll == shouldScroll)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pinnedMessages),const DeepCollectionEquality().hash(searchResults),messagesPageEntity,error,selectedMessage,highlightedMessageIndex,highlightedMessageId,showMenu,isLoading,showNewerLoader,showOlderLoader,editModeActive,replyModeActive,closeModal,shouldScroll,status);

@override
String toString() {
  return 'MessagesState(pinnedMessages: $pinnedMessages, searchResults: $searchResults, messagesPageEntity: $messagesPageEntity, error: $error, selectedMessage: $selectedMessage, highlightedMessageIndex: $highlightedMessageIndex, highlightedMessageId: $highlightedMessageId, showMenu: $showMenu, isLoading: $isLoading, showNewerLoader: $showNewerLoader, showOlderLoader: $showOlderLoader, editModeActive: $editModeActive, replyModeActive: $replyModeActive, closeModal: $closeModal, shouldScroll: $shouldScroll, status: $status)';
}


}

/// @nodoc
abstract mixin class $MessagesStateCopyWith<$Res>  {
  factory $MessagesStateCopyWith(MessagesState value, $Res Function(MessagesState) _then) = _$MessagesStateCopyWithImpl;
@useResult
$Res call({
 List<MessageEntity> pinnedMessages, List<MessageSearchResultEntity> searchResults, MessagesPageEntity? messagesPageEntity, String? error, MessageEntity? selectedMessage, int? highlightedMessageIndex, int? highlightedMessageId, bool showMenu, bool isLoading, bool showNewerLoader, bool showOlderLoader, bool editModeActive, bool replyModeActive, bool closeModal, bool shouldScroll, MessagesListStatus status
});


$MessagesPageEntityCopyWith<$Res>? get messagesPageEntity;$MessageEntityCopyWith<$Res>? get selectedMessage;

}
/// @nodoc
class _$MessagesStateCopyWithImpl<$Res>
    implements $MessagesStateCopyWith<$Res> {
  _$MessagesStateCopyWithImpl(this._self, this._then);

  final MessagesState _self;
  final $Res Function(MessagesState) _then;

/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pinnedMessages = null,Object? searchResults = null,Object? messagesPageEntity = freezed,Object? error = freezed,Object? selectedMessage = freezed,Object? highlightedMessageIndex = freezed,Object? highlightedMessageId = freezed,Object? showMenu = null,Object? isLoading = null,Object? showNewerLoader = null,Object? showOlderLoader = null,Object? editModeActive = null,Object? replyModeActive = null,Object? closeModal = null,Object? shouldScroll = null,Object? status = null,}) {
  return _then(_self.copyWith(
pinnedMessages: null == pinnedMessages ? _self.pinnedMessages : pinnedMessages // ignore: cast_nullable_to_non_nullable
as List<MessageEntity>,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<MessageSearchResultEntity>,messagesPageEntity: freezed == messagesPageEntity ? _self.messagesPageEntity : messagesPageEntity // ignore: cast_nullable_to_non_nullable
as MessagesPageEntity?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,selectedMessage: freezed == selectedMessage ? _self.selectedMessage : selectedMessage // ignore: cast_nullable_to_non_nullable
as MessageEntity?,highlightedMessageIndex: freezed == highlightedMessageIndex ? _self.highlightedMessageIndex : highlightedMessageIndex // ignore: cast_nullable_to_non_nullable
as int?,highlightedMessageId: freezed == highlightedMessageId ? _self.highlightedMessageId : highlightedMessageId // ignore: cast_nullable_to_non_nullable
as int?,showMenu: null == showMenu ? _self.showMenu : showMenu // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,showNewerLoader: null == showNewerLoader ? _self.showNewerLoader : showNewerLoader // ignore: cast_nullable_to_non_nullable
as bool,showOlderLoader: null == showOlderLoader ? _self.showOlderLoader : showOlderLoader // ignore: cast_nullable_to_non_nullable
as bool,editModeActive: null == editModeActive ? _self.editModeActive : editModeActive // ignore: cast_nullable_to_non_nullable
as bool,replyModeActive: null == replyModeActive ? _self.replyModeActive : replyModeActive // ignore: cast_nullable_to_non_nullable
as bool,closeModal: null == closeModal ? _self.closeModal : closeModal // ignore: cast_nullable_to_non_nullable
as bool,shouldScroll: null == shouldScroll ? _self.shouldScroll : shouldScroll // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MessagesListStatus,
  ));
}
/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessagesPageEntityCopyWith<$Res>? get messagesPageEntity {
    if (_self.messagesPageEntity == null) {
    return null;
  }

  return $MessagesPageEntityCopyWith<$Res>(_self.messagesPageEntity!, (value) {
    return _then(_self.copyWith(messagesPageEntity: value));
  });
}/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageEntityCopyWith<$Res>? get selectedMessage {
    if (_self.selectedMessage == null) {
    return null;
  }

  return $MessageEntityCopyWith<$Res>(_self.selectedMessage!, (value) {
    return _then(_self.copyWith(selectedMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [MessagesState].
extension MessagesStatePatterns on MessagesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessagesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessagesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessagesState value)  $default,){
final _that = this;
switch (_that) {
case _MessagesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessagesState value)?  $default,){
final _that = this;
switch (_that) {
case _MessagesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MessageEntity> pinnedMessages,  List<MessageSearchResultEntity> searchResults,  MessagesPageEntity? messagesPageEntity,  String? error,  MessageEntity? selectedMessage,  int? highlightedMessageIndex,  int? highlightedMessageId,  bool showMenu,  bool isLoading,  bool showNewerLoader,  bool showOlderLoader,  bool editModeActive,  bool replyModeActive,  bool closeModal,  bool shouldScroll,  MessagesListStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessagesState() when $default != null:
return $default(_that.pinnedMessages,_that.searchResults,_that.messagesPageEntity,_that.error,_that.selectedMessage,_that.highlightedMessageIndex,_that.highlightedMessageId,_that.showMenu,_that.isLoading,_that.showNewerLoader,_that.showOlderLoader,_that.editModeActive,_that.replyModeActive,_that.closeModal,_that.shouldScroll,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MessageEntity> pinnedMessages,  List<MessageSearchResultEntity> searchResults,  MessagesPageEntity? messagesPageEntity,  String? error,  MessageEntity? selectedMessage,  int? highlightedMessageIndex,  int? highlightedMessageId,  bool showMenu,  bool isLoading,  bool showNewerLoader,  bool showOlderLoader,  bool editModeActive,  bool replyModeActive,  bool closeModal,  bool shouldScroll,  MessagesListStatus status)  $default,) {final _that = this;
switch (_that) {
case _MessagesState():
return $default(_that.pinnedMessages,_that.searchResults,_that.messagesPageEntity,_that.error,_that.selectedMessage,_that.highlightedMessageIndex,_that.highlightedMessageId,_that.showMenu,_that.isLoading,_that.showNewerLoader,_that.showOlderLoader,_that.editModeActive,_that.replyModeActive,_that.closeModal,_that.shouldScroll,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MessageEntity> pinnedMessages,  List<MessageSearchResultEntity> searchResults,  MessagesPageEntity? messagesPageEntity,  String? error,  MessageEntity? selectedMessage,  int? highlightedMessageIndex,  int? highlightedMessageId,  bool showMenu,  bool isLoading,  bool showNewerLoader,  bool showOlderLoader,  bool editModeActive,  bool replyModeActive,  bool closeModal,  bool shouldScroll,  MessagesListStatus status)?  $default,) {final _that = this;
switch (_that) {
case _MessagesState() when $default != null:
return $default(_that.pinnedMessages,_that.searchResults,_that.messagesPageEntity,_that.error,_that.selectedMessage,_that.highlightedMessageIndex,_that.highlightedMessageId,_that.showMenu,_that.isLoading,_that.showNewerLoader,_that.showOlderLoader,_that.editModeActive,_that.replyModeActive,_that.closeModal,_that.shouldScroll,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _MessagesState implements MessagesState {
  const _MessagesState({final  List<MessageEntity> pinnedMessages = const [], final  List<MessageSearchResultEntity> searchResults = const [], this.messagesPageEntity, this.error, this.selectedMessage, this.highlightedMessageIndex, this.highlightedMessageId, this.showMenu = false, this.isLoading = false, this.showNewerLoader = false, this.showOlderLoader = false, this.editModeActive = false, this.replyModeActive = false, this.closeModal = false, this.shouldScroll = false, this.status = MessagesListStatus.list}): _pinnedMessages = pinnedMessages,_searchResults = searchResults;
  

 final  List<MessageEntity> _pinnedMessages;
@override@JsonKey() List<MessageEntity> get pinnedMessages {
  if (_pinnedMessages is EqualUnmodifiableListView) return _pinnedMessages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pinnedMessages);
}

 final  List<MessageSearchResultEntity> _searchResults;
@override@JsonKey() List<MessageSearchResultEntity> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}

@override final  MessagesPageEntity? messagesPageEntity;
@override final  String? error;
@override final  MessageEntity? selectedMessage;
@override final  int? highlightedMessageIndex;
@override final  int? highlightedMessageId;
@override@JsonKey() final  bool showMenu;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool showNewerLoader;
@override@JsonKey() final  bool showOlderLoader;
@override@JsonKey() final  bool editModeActive;
@override@JsonKey() final  bool replyModeActive;
@override@JsonKey() final  bool closeModal;
@override@JsonKey() final  bool shouldScroll;
@override@JsonKey() final  MessagesListStatus status;

/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessagesStateCopyWith<_MessagesState> get copyWith => __$MessagesStateCopyWithImpl<_MessagesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessagesState&&const DeepCollectionEquality().equals(other._pinnedMessages, _pinnedMessages)&&const DeepCollectionEquality().equals(other._searchResults, _searchResults)&&(identical(other.messagesPageEntity, messagesPageEntity) || other.messagesPageEntity == messagesPageEntity)&&(identical(other.error, error) || other.error == error)&&(identical(other.selectedMessage, selectedMessage) || other.selectedMessage == selectedMessage)&&(identical(other.highlightedMessageIndex, highlightedMessageIndex) || other.highlightedMessageIndex == highlightedMessageIndex)&&(identical(other.highlightedMessageId, highlightedMessageId) || other.highlightedMessageId == highlightedMessageId)&&(identical(other.showMenu, showMenu) || other.showMenu == showMenu)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.showNewerLoader, showNewerLoader) || other.showNewerLoader == showNewerLoader)&&(identical(other.showOlderLoader, showOlderLoader) || other.showOlderLoader == showOlderLoader)&&(identical(other.editModeActive, editModeActive) || other.editModeActive == editModeActive)&&(identical(other.replyModeActive, replyModeActive) || other.replyModeActive == replyModeActive)&&(identical(other.closeModal, closeModal) || other.closeModal == closeModal)&&(identical(other.shouldScroll, shouldScroll) || other.shouldScroll == shouldScroll)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pinnedMessages),const DeepCollectionEquality().hash(_searchResults),messagesPageEntity,error,selectedMessage,highlightedMessageIndex,highlightedMessageId,showMenu,isLoading,showNewerLoader,showOlderLoader,editModeActive,replyModeActive,closeModal,shouldScroll,status);

@override
String toString() {
  return 'MessagesState(pinnedMessages: $pinnedMessages, searchResults: $searchResults, messagesPageEntity: $messagesPageEntity, error: $error, selectedMessage: $selectedMessage, highlightedMessageIndex: $highlightedMessageIndex, highlightedMessageId: $highlightedMessageId, showMenu: $showMenu, isLoading: $isLoading, showNewerLoader: $showNewerLoader, showOlderLoader: $showOlderLoader, editModeActive: $editModeActive, replyModeActive: $replyModeActive, closeModal: $closeModal, shouldScroll: $shouldScroll, status: $status)';
}


}

/// @nodoc
abstract mixin class _$MessagesStateCopyWith<$Res> implements $MessagesStateCopyWith<$Res> {
  factory _$MessagesStateCopyWith(_MessagesState value, $Res Function(_MessagesState) _then) = __$MessagesStateCopyWithImpl;
@override @useResult
$Res call({
 List<MessageEntity> pinnedMessages, List<MessageSearchResultEntity> searchResults, MessagesPageEntity? messagesPageEntity, String? error, MessageEntity? selectedMessage, int? highlightedMessageIndex, int? highlightedMessageId, bool showMenu, bool isLoading, bool showNewerLoader, bool showOlderLoader, bool editModeActive, bool replyModeActive, bool closeModal, bool shouldScroll, MessagesListStatus status
});


@override $MessagesPageEntityCopyWith<$Res>? get messagesPageEntity;@override $MessageEntityCopyWith<$Res>? get selectedMessage;

}
/// @nodoc
class __$MessagesStateCopyWithImpl<$Res>
    implements _$MessagesStateCopyWith<$Res> {
  __$MessagesStateCopyWithImpl(this._self, this._then);

  final _MessagesState _self;
  final $Res Function(_MessagesState) _then;

/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pinnedMessages = null,Object? searchResults = null,Object? messagesPageEntity = freezed,Object? error = freezed,Object? selectedMessage = freezed,Object? highlightedMessageIndex = freezed,Object? highlightedMessageId = freezed,Object? showMenu = null,Object? isLoading = null,Object? showNewerLoader = null,Object? showOlderLoader = null,Object? editModeActive = null,Object? replyModeActive = null,Object? closeModal = null,Object? shouldScroll = null,Object? status = null,}) {
  return _then(_MessagesState(
pinnedMessages: null == pinnedMessages ? _self._pinnedMessages : pinnedMessages // ignore: cast_nullable_to_non_nullable
as List<MessageEntity>,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<MessageSearchResultEntity>,messagesPageEntity: freezed == messagesPageEntity ? _self.messagesPageEntity : messagesPageEntity // ignore: cast_nullable_to_non_nullable
as MessagesPageEntity?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,selectedMessage: freezed == selectedMessage ? _self.selectedMessage : selectedMessage // ignore: cast_nullable_to_non_nullable
as MessageEntity?,highlightedMessageIndex: freezed == highlightedMessageIndex ? _self.highlightedMessageIndex : highlightedMessageIndex // ignore: cast_nullable_to_non_nullable
as int?,highlightedMessageId: freezed == highlightedMessageId ? _self.highlightedMessageId : highlightedMessageId // ignore: cast_nullable_to_non_nullable
as int?,showMenu: null == showMenu ? _self.showMenu : showMenu // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,showNewerLoader: null == showNewerLoader ? _self.showNewerLoader : showNewerLoader // ignore: cast_nullable_to_non_nullable
as bool,showOlderLoader: null == showOlderLoader ? _self.showOlderLoader : showOlderLoader // ignore: cast_nullable_to_non_nullable
as bool,editModeActive: null == editModeActive ? _self.editModeActive : editModeActive // ignore: cast_nullable_to_non_nullable
as bool,replyModeActive: null == replyModeActive ? _self.replyModeActive : replyModeActive // ignore: cast_nullable_to_non_nullable
as bool,closeModal: null == closeModal ? _self.closeModal : closeModal // ignore: cast_nullable_to_non_nullable
as bool,shouldScroll: null == shouldScroll ? _self.shouldScroll : shouldScroll // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MessagesListStatus,
  ));
}

/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessagesPageEntityCopyWith<$Res>? get messagesPageEntity {
    if (_self.messagesPageEntity == null) {
    return null;
  }

  return $MessagesPageEntityCopyWith<$Res>(_self.messagesPageEntity!, (value) {
    return _then(_self.copyWith(messagesPageEntity: value));
  });
}/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageEntityCopyWith<$Res>? get selectedMessage {
    if (_self.selectedMessage == null) {
    return null;
  }

  return $MessageEntityCopyWith<$Res>(_self.selectedMessage!, (value) {
    return _then(_self.copyWith(selectedMessage: value));
  });
}
}

// dart format on

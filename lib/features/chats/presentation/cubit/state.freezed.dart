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
mixin _$ChatsState {

 List<ChatListItemEntity> get chats; List<ChatListItemEntity> get archivedChats; String? get error; bool get isLoading; bool get shouldNavigate; bool get showLoader; ChatsScreenStatus get status;
/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatsStateCopyWith<ChatsState> get copyWith => _$ChatsStateCopyWithImpl<ChatsState>(this as ChatsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatsState&&const DeepCollectionEquality().equals(other.chats, chats)&&const DeepCollectionEquality().equals(other.archivedChats, archivedChats)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.shouldNavigate, shouldNavigate) || other.shouldNavigate == shouldNavigate)&&(identical(other.showLoader, showLoader) || other.showLoader == showLoader)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(chats),const DeepCollectionEquality().hash(archivedChats),error,isLoading,shouldNavigate,showLoader,status);

@override
String toString() {
  return 'ChatsState(chats: $chats, archivedChats: $archivedChats, error: $error, isLoading: $isLoading, shouldNavigate: $shouldNavigate, showLoader: $showLoader, status: $status)';
}


}

/// @nodoc
abstract mixin class $ChatsStateCopyWith<$Res>  {
  factory $ChatsStateCopyWith(ChatsState value, $Res Function(ChatsState) _then) = _$ChatsStateCopyWithImpl;
@useResult
$Res call({
 List<ChatListItemEntity> chats, List<ChatListItemEntity> archivedChats, String? error, bool isLoading, bool shouldNavigate, bool showLoader, ChatsScreenStatus status
});




}
/// @nodoc
class _$ChatsStateCopyWithImpl<$Res>
    implements $ChatsStateCopyWith<$Res> {
  _$ChatsStateCopyWithImpl(this._self, this._then);

  final ChatsState _self;
  final $Res Function(ChatsState) _then;

/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chats = null,Object? archivedChats = null,Object? error = freezed,Object? isLoading = null,Object? shouldNavigate = null,Object? showLoader = null,Object? status = null,}) {
  return _then(_self.copyWith(
chats: null == chats ? _self.chats : chats // ignore: cast_nullable_to_non_nullable
as List<ChatListItemEntity>,archivedChats: null == archivedChats ? _self.archivedChats : archivedChats // ignore: cast_nullable_to_non_nullable
as List<ChatListItemEntity>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,shouldNavigate: null == shouldNavigate ? _self.shouldNavigate : shouldNavigate // ignore: cast_nullable_to_non_nullable
as bool,showLoader: null == showLoader ? _self.showLoader : showLoader // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatsScreenStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatsState].
extension ChatsStatePatterns on ChatsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatsState value)  $default,){
final _that = this;
switch (_that) {
case _ChatsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatsState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChatListItemEntity> chats,  List<ChatListItemEntity> archivedChats,  String? error,  bool isLoading,  bool shouldNavigate,  bool showLoader,  ChatsScreenStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatsState() when $default != null:
return $default(_that.chats,_that.archivedChats,_that.error,_that.isLoading,_that.shouldNavigate,_that.showLoader,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChatListItemEntity> chats,  List<ChatListItemEntity> archivedChats,  String? error,  bool isLoading,  bool shouldNavigate,  bool showLoader,  ChatsScreenStatus status)  $default,) {final _that = this;
switch (_that) {
case _ChatsState():
return $default(_that.chats,_that.archivedChats,_that.error,_that.isLoading,_that.shouldNavigate,_that.showLoader,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChatListItemEntity> chats,  List<ChatListItemEntity> archivedChats,  String? error,  bool isLoading,  bool shouldNavigate,  bool showLoader,  ChatsScreenStatus status)?  $default,) {final _that = this;
switch (_that) {
case _ChatsState() when $default != null:
return $default(_that.chats,_that.archivedChats,_that.error,_that.isLoading,_that.shouldNavigate,_that.showLoader,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _ChatsState implements ChatsState {
  const _ChatsState({final  List<ChatListItemEntity> chats = const [], final  List<ChatListItemEntity> archivedChats = const [], this.error, this.isLoading = false, this.shouldNavigate = false, this.showLoader = false, this.status = ChatsScreenStatus.active}): _chats = chats,_archivedChats = archivedChats;
  

 final  List<ChatListItemEntity> _chats;
@override@JsonKey() List<ChatListItemEntity> get chats {
  if (_chats is EqualUnmodifiableListView) return _chats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chats);
}

 final  List<ChatListItemEntity> _archivedChats;
@override@JsonKey() List<ChatListItemEntity> get archivedChats {
  if (_archivedChats is EqualUnmodifiableListView) return _archivedChats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_archivedChats);
}

@override final  String? error;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool shouldNavigate;
@override@JsonKey() final  bool showLoader;
@override@JsonKey() final  ChatsScreenStatus status;

/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatsStateCopyWith<_ChatsState> get copyWith => __$ChatsStateCopyWithImpl<_ChatsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatsState&&const DeepCollectionEquality().equals(other._chats, _chats)&&const DeepCollectionEquality().equals(other._archivedChats, _archivedChats)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.shouldNavigate, shouldNavigate) || other.shouldNavigate == shouldNavigate)&&(identical(other.showLoader, showLoader) || other.showLoader == showLoader)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chats),const DeepCollectionEquality().hash(_archivedChats),error,isLoading,shouldNavigate,showLoader,status);

@override
String toString() {
  return 'ChatsState(chats: $chats, archivedChats: $archivedChats, error: $error, isLoading: $isLoading, shouldNavigate: $shouldNavigate, showLoader: $showLoader, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ChatsStateCopyWith<$Res> implements $ChatsStateCopyWith<$Res> {
  factory _$ChatsStateCopyWith(_ChatsState value, $Res Function(_ChatsState) _then) = __$ChatsStateCopyWithImpl;
@override @useResult
$Res call({
 List<ChatListItemEntity> chats, List<ChatListItemEntity> archivedChats, String? error, bool isLoading, bool shouldNavigate, bool showLoader, ChatsScreenStatus status
});




}
/// @nodoc
class __$ChatsStateCopyWithImpl<$Res>
    implements _$ChatsStateCopyWith<$Res> {
  __$ChatsStateCopyWithImpl(this._self, this._then);

  final _ChatsState _self;
  final $Res Function(_ChatsState) _then;

/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chats = null,Object? archivedChats = null,Object? error = freezed,Object? isLoading = null,Object? shouldNavigate = null,Object? showLoader = null,Object? status = null,}) {
  return _then(_ChatsState(
chats: null == chats ? _self._chats : chats // ignore: cast_nullable_to_non_nullable
as List<ChatListItemEntity>,archivedChats: null == archivedChats ? _self._archivedChats : archivedChats // ignore: cast_nullable_to_non_nullable
as List<ChatListItemEntity>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,shouldNavigate: null == shouldNavigate ? _self.shouldNavigate : shouldNavigate // ignore: cast_nullable_to_non_nullable
as bool,showLoader: null == showLoader ? _self.showLoader : showLoader // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatsScreenStatus,
  ));
}


}

// dart format on

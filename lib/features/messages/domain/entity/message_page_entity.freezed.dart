// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_page_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessagesPageEntity {

 bool get hasPrevious; bool get hasNext; List<MessageEntity> get messages;
/// Create a copy of MessagesPageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessagesPageEntityCopyWith<MessagesPageEntity> get copyWith => _$MessagesPageEntityCopyWithImpl<MessagesPageEntity>(this as MessagesPageEntity, _$identity);

  /// Serializes this MessagesPageEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagesPageEntity&&(identical(other.hasPrevious, hasPrevious) || other.hasPrevious == hasPrevious)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&const DeepCollectionEquality().equals(other.messages, messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasPrevious,hasNext,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'MessagesPageEntity(hasPrevious: $hasPrevious, hasNext: $hasNext, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $MessagesPageEntityCopyWith<$Res>  {
  factory $MessagesPageEntityCopyWith(MessagesPageEntity value, $Res Function(MessagesPageEntity) _then) = _$MessagesPageEntityCopyWithImpl;
@useResult
$Res call({
 bool hasPrevious, bool hasNext, List<MessageEntity> messages
});




}
/// @nodoc
class _$MessagesPageEntityCopyWithImpl<$Res>
    implements $MessagesPageEntityCopyWith<$Res> {
  _$MessagesPageEntityCopyWithImpl(this._self, this._then);

  final MessagesPageEntity _self;
  final $Res Function(MessagesPageEntity) _then;

/// Create a copy of MessagesPageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasPrevious = null,Object? hasNext = null,Object? messages = null,}) {
  return _then(_self.copyWith(
hasPrevious: null == hasPrevious ? _self.hasPrevious : hasPrevious // ignore: cast_nullable_to_non_nullable
as bool,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [MessagesPageEntity].
extension MessagesPageEntityPatterns on MessagesPageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessagesPageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessagesPageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessagesPageEntity value)  $default,){
final _that = this;
switch (_that) {
case _MessagesPageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessagesPageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MessagesPageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasPrevious,  bool hasNext,  List<MessageEntity> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessagesPageEntity() when $default != null:
return $default(_that.hasPrevious,_that.hasNext,_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasPrevious,  bool hasNext,  List<MessageEntity> messages)  $default,) {final _that = this;
switch (_that) {
case _MessagesPageEntity():
return $default(_that.hasPrevious,_that.hasNext,_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasPrevious,  bool hasNext,  List<MessageEntity> messages)?  $default,) {final _that = this;
switch (_that) {
case _MessagesPageEntity() when $default != null:
return $default(_that.hasPrevious,_that.hasNext,_that.messages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessagesPageEntity implements MessagesPageEntity {
  const _MessagesPageEntity({required this.hasPrevious, required this.hasNext, required final  List<MessageEntity> messages}): _messages = messages;
  factory _MessagesPageEntity.fromJson(Map<String, dynamic> json) => _$MessagesPageEntityFromJson(json);

@override final  bool hasPrevious;
@override final  bool hasNext;
 final  List<MessageEntity> _messages;
@override List<MessageEntity> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of MessagesPageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessagesPageEntityCopyWith<_MessagesPageEntity> get copyWith => __$MessagesPageEntityCopyWithImpl<_MessagesPageEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessagesPageEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessagesPageEntity&&(identical(other.hasPrevious, hasPrevious) || other.hasPrevious == hasPrevious)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&const DeepCollectionEquality().equals(other._messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasPrevious,hasNext,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'MessagesPageEntity(hasPrevious: $hasPrevious, hasNext: $hasNext, messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$MessagesPageEntityCopyWith<$Res> implements $MessagesPageEntityCopyWith<$Res> {
  factory _$MessagesPageEntityCopyWith(_MessagesPageEntity value, $Res Function(_MessagesPageEntity) _then) = __$MessagesPageEntityCopyWithImpl;
@override @useResult
$Res call({
 bool hasPrevious, bool hasNext, List<MessageEntity> messages
});




}
/// @nodoc
class __$MessagesPageEntityCopyWithImpl<$Res>
    implements _$MessagesPageEntityCopyWith<$Res> {
  __$MessagesPageEntityCopyWithImpl(this._self, this._then);

  final _MessagesPageEntity _self;
  final $Res Function(_MessagesPageEntity) _then;

/// Create a copy of MessagesPageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasPrevious = null,Object? hasNext = null,Object? messages = null,}) {
  return _then(_MessagesPageEntity(
hasPrevious: null == hasPrevious ? _self.hasPrevious : hasPrevious // ignore: cast_nullable_to_non_nullable
as bool,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageEntity>,
  ));
}


}

// dart format on

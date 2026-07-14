// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_reaction_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageReactionSummaryModel {

 ReactionType get type; int get count;
/// Create a copy of MessageReactionSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageReactionSummaryModelCopyWith<MessageReactionSummaryModel> get copyWith => _$MessageReactionSummaryModelCopyWithImpl<MessageReactionSummaryModel>(this as MessageReactionSummaryModel, _$identity);

  /// Serializes this MessageReactionSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageReactionSummaryModel&&(identical(other.type, type) || other.type == type)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,count);

@override
String toString() {
  return 'MessageReactionSummaryModel(type: $type, count: $count)';
}


}

/// @nodoc
abstract mixin class $MessageReactionSummaryModelCopyWith<$Res>  {
  factory $MessageReactionSummaryModelCopyWith(MessageReactionSummaryModel value, $Res Function(MessageReactionSummaryModel) _then) = _$MessageReactionSummaryModelCopyWithImpl;
@useResult
$Res call({
 ReactionType type, int count
});




}
/// @nodoc
class _$MessageReactionSummaryModelCopyWithImpl<$Res>
    implements $MessageReactionSummaryModelCopyWith<$Res> {
  _$MessageReactionSummaryModelCopyWithImpl(this._self, this._then);

  final MessageReactionSummaryModel _self;
  final $Res Function(MessageReactionSummaryModel) _then;

/// Create a copy of MessageReactionSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? count = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReactionType,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageReactionSummaryModel].
extension MessageReactionSummaryModelPatterns on MessageReactionSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageReactionSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageReactionSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageReactionSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _MessageReactionSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageReactionSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _MessageReactionSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReactionType type,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageReactionSummaryModel() when $default != null:
return $default(_that.type,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReactionType type,  int count)  $default,) {final _that = this;
switch (_that) {
case _MessageReactionSummaryModel():
return $default(_that.type,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReactionType type,  int count)?  $default,) {final _that = this;
switch (_that) {
case _MessageReactionSummaryModel() when $default != null:
return $default(_that.type,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageReactionSummaryModel implements MessageReactionSummaryModel {
  const _MessageReactionSummaryModel({required this.type, required this.count});
  factory _MessageReactionSummaryModel.fromJson(Map<String, dynamic> json) => _$MessageReactionSummaryModelFromJson(json);

@override final  ReactionType type;
@override final  int count;

/// Create a copy of MessageReactionSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageReactionSummaryModelCopyWith<_MessageReactionSummaryModel> get copyWith => __$MessageReactionSummaryModelCopyWithImpl<_MessageReactionSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageReactionSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageReactionSummaryModel&&(identical(other.type, type) || other.type == type)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,count);

@override
String toString() {
  return 'MessageReactionSummaryModel(type: $type, count: $count)';
}


}

/// @nodoc
abstract mixin class _$MessageReactionSummaryModelCopyWith<$Res> implements $MessageReactionSummaryModelCopyWith<$Res> {
  factory _$MessageReactionSummaryModelCopyWith(_MessageReactionSummaryModel value, $Res Function(_MessageReactionSummaryModel) _then) = __$MessageReactionSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 ReactionType type, int count
});




}
/// @nodoc
class __$MessageReactionSummaryModelCopyWithImpl<$Res>
    implements _$MessageReactionSummaryModelCopyWith<$Res> {
  __$MessageReactionSummaryModelCopyWithImpl(this._self, this._then);

  final _MessageReactionSummaryModel _self;
  final $Res Function(_MessageReactionSummaryModel) _then;

/// Create a copy of MessageReactionSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? count = null,}) {
  return _then(_MessageReactionSummaryModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReactionType,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

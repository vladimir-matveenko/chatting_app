import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    String? error,
    @Default(false) bool isLoading,
    @Default(false) bool changedSuccessful,
  }) = _ChangePasswordState;
}

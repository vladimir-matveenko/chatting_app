import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

enum ResetPasswordStatus { requestCode, validateCode, setPassword, success }

@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default(ResetPasswordStatus.requestCode) ResetPasswordStatus status,
    String? error,
    String? resetToken,
    @Default(false) bool isLoading,
  }) = _ResetPasswordState;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entity/user_entity.dart';

part 'state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserEntity? profile,
    String? error,
    @Default(false) bool isLoading,
    @Default(false) bool createdSuccessful,
    @Default(false) bool updatedSuccessful,
  }) = _ProfileState;
}

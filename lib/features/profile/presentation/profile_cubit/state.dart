import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../auth/domain/entity/user_entity.dart';

part 'state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    PackageInfo? appInfo,
    UserEntity? profile,
    String? error,
    @Default(false) bool isLoading,
    @Default(false) bool isAvatarLoading,
    @Default(false) bool isAppInfoLoading,
    @Default(false) bool createdSuccessful,
    @Default(false) bool updatedSuccessful,
    @Default([]) List<String> log,
  }) = _ProfileState;
}

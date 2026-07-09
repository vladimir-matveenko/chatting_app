import 'package:equatable/equatable.dart';

import '../../../auth/domain/entity/user_entity.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.profile,
    this.error,
    this.isLoading = false,
    this.success = false,
  });

  final UserEntity? profile;
  final String? error;
  final bool isLoading;
  final bool success;

  ProfileState copyWith({
    UserEntity? profile,
    String? error,
    bool? isLoading,
    bool? success,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      success: success ?? this.success,
    );
  }

  @override
  List<dynamic> get props => [profile, error, isLoading, success];
}

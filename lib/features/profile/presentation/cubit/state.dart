import 'package:equatable/equatable.dart';

import '../../domain/entity/profile_entity.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.profile,
    this.error,
    this.isLoading = false,
    this.success = false,
  });

  final ProfileEntity? profile;
  final String? error;
  final bool isLoading;
  final bool success;

  ProfileState copyWith({
    ProfileEntity? profile,
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

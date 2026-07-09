import 'package:equatable/equatable.dart';

import '../../../auth/domain/entity/user_entity.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.profile,
    this.error,
    this.isLoading = false,
    this.createdSuccessful = false,
    this.updatedSuccessful = false,
  });

  final UserEntity? profile;
  final String? error;
  final bool isLoading;
  final bool createdSuccessful;
  final bool updatedSuccessful;

  ProfileState copyWith({
    UserEntity? profile,
    String? error,
    bool? isLoading,
    bool? createdSuccessful,
    bool? updatedSuccessful,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      createdSuccessful: createdSuccessful ?? this.createdSuccessful,
      updatedSuccessful: updatedSuccessful ?? this.updatedSuccessful,
    );
  }

  @override
  List<dynamic> get props => [
    profile,
    error,
    isLoading,
    createdSuccessful,
    updatedSuccessful,
  ];
}

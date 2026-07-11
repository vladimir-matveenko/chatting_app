import 'package:equatable/equatable.dart';

import '../../../auth/domain/entity/user_entity.dart';

class ChatsState extends Equatable {
  const ChatsState({this.profile, this.error, this.isLoading = false});

  final UserEntity? profile;
  final String? error;
  final bool isLoading;

  ChatsState copyWith({
    UserEntity? profile,
    String? error,
    bool? isLoading,
    bool? createdSuccessful,
    bool? updatedSuccessful,
  }) {
    return ChatsState(
      profile: profile ?? this.profile,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<dynamic> get props => [profile, error, isLoading];
}

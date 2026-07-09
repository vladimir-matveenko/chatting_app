import 'package:equatable/equatable.dart';

class ChangePasswordState extends Equatable {
  const ChangePasswordState({
    this.error,
    this.isLoading = false,
    this.changedSuccessful = false,
  });

  final String? error;
  final bool isLoading;
  final bool changedSuccessful;

  ChangePasswordState copyWith({
    String? error,
    bool? isLoading,
    bool? changedSuccessful,
  }) {
    return ChangePasswordState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      changedSuccessful: changedSuccessful ?? this.changedSuccessful,
    );
  }

  @override
  List<dynamic> get props => [error, isLoading, changedSuccessful];
}

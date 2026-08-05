import 'package:equatable/equatable.dart';

import '../../domain/entity/users_list_item_entity.dart';

class UsersState extends Equatable {
  const UsersState({
    this.users = const [],
    this.error,
    this.isLoading = false,
    this.showLoader = false,
  });

  final List<UserListItemEntity> users;
  final String? error;
  final bool isLoading;
  final bool showLoader;

  UsersState copyWith({
    List<UserListItemEntity>? users,
    String? error,
    bool? isLoading,
    bool? showLoader,
  }) {
    return UsersState(
      users: users ?? this.users,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      showLoader: showLoader ?? this.showLoader,
    );
  }

  @override
  List<dynamic> get props => [users, error, isLoading, showLoader];
}

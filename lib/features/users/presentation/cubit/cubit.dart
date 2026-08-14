import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/utils/app_utils.dart';
import '../../domain/usecases/load_users_usecase.dart';
import 'state.dart';

@lazySingleton
class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._loadUsersUseCase) : super(const UsersState());
  final LoadUsersUseCase _loadUsersUseCase;

  final int defaultLimit = 20;

  Future<void> loadUsers({bool loadSilent = true, String? query}) async {
    emit(state.copyWith(isLoading: !loadSilent));
    final profile = await _loadUsersUseCase(
      LoadUsersParams(query: query, limit: defaultLimit, offset: 0),
    );
    profile.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(users: r, isLoading: false));
      },
    );
  }

  Future<void> loadMoreUsers({String? query}) async {
    if (state.users.length < defaultLimit) {
      return;
    }
    emit(state.copyWith(showLoader: true));
    final profile = await _loadUsersUseCase(
      LoadUsersParams(
        query: query,
        offset: state.users.length,
        limit: defaultLimit,
      ),
    );
    profile.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            showLoader: false,
          ),
        );
      },
      (r) {
        final existingIds = state.users.map((e) => e.id).toSet();

        final users = AppUtils.mergeBy(
          state.users,
          r.where((m) => !existingIds.contains(m.id)).toList(),
          getId: (m) => m.id,
        );

        emit(state.copyWith(users: users, showLoader: false));
      },
    );
  }

  Future<void> disableError() async {
    emit(state.copyWith(error: null));
  }
}

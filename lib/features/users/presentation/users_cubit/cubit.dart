import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/load_users_usecase.dart';
import 'state.dart';

@lazySingleton
class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._loadUsersUseCase) : super(const UsersState());
  final LoadUsersUseCase _loadUsersUseCase;

  Future<void> loadUsers({bool loadSilent = true}) async {
    if (!loadSilent) {
      emit(state.copyWith(isLoading: true));
    }
    final profile = await _loadUsersUseCase(NoParams());
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

  Future<void> disableError() async {
    emit(state.copyWith(error: ''));
  }
}

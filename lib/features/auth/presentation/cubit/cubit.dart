import 'package:chatting_app/features/auth/domain/usecases/get_user_profile_usecase.dart';
import 'package:chatting_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:chatting_app/features/auth/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/check_auth_usecase.dart' show CheckAuthUseCase;

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._checkAuthUseCase,
    this._getUserProfileUseCase,
    this._logoutUseCase,
  ) : super(const AuthState());
  final CheckAuthUseCase _checkAuthUseCase;
  final GetUserProfileUseCase _getUserProfileUseCase;
  final LogoutUseCase _logoutUseCase;

  Future<void> checkAuth() async {
    final result = await _checkAuthUseCase(NoParams());

    result.fold(
      (l) {
        emit(state.copyWith(status: AuthStatus.unauthenticated));
      },
      (r) async {
        if (r) {
          await _getUserProfileUseCase.call(NoParams());
          emit(state.copyWith(status: AuthStatus.authenticated));
        } else {
          emit(state.copyWith(status: AuthStatus.unauthenticated));
        }
      },
    );
  }

  Future<void> fakeAuth() async {
    emit(state.copyWith(status: AuthStatus.authenticated));
  }

  Future<void> logout() async {
    await _logoutUseCase.call(NoParams());
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }
}

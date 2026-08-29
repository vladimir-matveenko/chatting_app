import 'package:chatting_app/features/auth/domain/usecases/check_server_usecase.dart';
import 'package:chatting_app/features/auth/domain/usecases/clear_cache_usecase.dart';
import 'package:chatting_app/features/auth/domain/usecases/get_token_usecase.dart';
import 'package:chatting_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/websocket/socket_service.dart';
import '../../domain/usecases/check_auth_usecase.dart';
import 'state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._checkAuthUseCase,
    this._logoutUseCase,
    this._getTokenUseCase,
    this._checkServerUseCase,
    this._socketService,
    this._clearCacheUseCase,
  ) : super(const AuthState());
  final CheckAuthUseCase _checkAuthUseCase;
  final LogoutUseCase _logoutUseCase;
  final GetTokenUseCase _getTokenUseCase;
  final ClearCacheUseCase _clearCacheUseCase;
  final CheckServerUseCase _checkServerUseCase;
  final SocketService _socketService;

  bool hasLoggedIn = false;

  Future<bool> _waitForBackend() async {
    const maxAttempts = 30;

    for (var i = 0; i < maxAttempts; i++) {
      try {
        final result = await _checkServerUseCase(NoParams());

        final isAvailable = result.fold((l) => false, (r) => r);

        if (isAvailable) {
          return true;
        }
      } catch (_) {}

      await Future.delayed(const Duration(seconds: 2));
    }

    return false;
  }

  Future<void> _handleAuthenticated() async {
    final token = await _getTokenUseCase(NoParams());
    token.fold((l) async {}, (r) async {
      await _socketService.connect();
    });
    emit(state.copyWith(status: AuthStatus.authenticated));
  }

  Future<void> checkAuth() async {
    final result = await _checkAuthUseCase(NoParams());

    result.fold(
      (l) {
        emit(state.copyWith(status: AuthStatus.unauthenticated));
      },
      (r) async {
        if (r) {
          if (hasLoggedIn) {
            await _handleAuthenticated();
          } else {
            // check if the server is running
            emit(state.copyWith(status: AuthStatus.serverLoading));
            final result = await _waitForBackend();
            if (result) {
              await _handleAuthenticated();
            } else {
              // no action if server is not ready
              return;
            }
          }
        } else {
          // check if the server is running
          emit(state.copyWith(status: AuthStatus.serverLoading));
          final result = await _waitForBackend();
          if (result) {
            emit(state.copyWith(status: AuthStatus.unauthenticated));
          } else {
            // no action if server is not ready
            return;
          }
        }
      },
    );
  }

  Future<void> logout() async {
    await _logoutUseCase.call(NoParams());
    await _socketService.disconnect();
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }

  Future<void> clearCache() async {
    await _clearCacheUseCase.call(NoParams());
    await _socketService.disconnect();
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }
}

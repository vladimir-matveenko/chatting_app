import 'package:chatting_app/features/auth/domain/usecases/clear_cache_usecase.dart';
import 'package:chatting_app/features/auth/domain/usecases/get_token_usecase.dart';
import 'package:chatting_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:chatting_app/features/auth/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/websocket/socket_service.dart';
import '../../domain/usecases/check_auth_usecase.dart' show CheckAuthUseCase;

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._checkAuthUseCase,
    this._logoutUseCase,
    this._getTokenUseCase,
    this._socketService,
    this._clearCacheUseCase,
  ) : super(const AuthState());
  final CheckAuthUseCase _checkAuthUseCase;
  final LogoutUseCase _logoutUseCase;
  final GetTokenUseCase _getTokenUseCase;
  final ClearCacheUseCase _clearCacheUseCase;
  final SocketService _socketService;

  Future<void> checkAuth() async {
    final result = await _checkAuthUseCase(NoParams());

    result.fold(
      (l) {
        emit(state.copyWith(status: AuthStatus.unauthenticated));
      },
      (r) async {
        if (r) {
          final token = await _getTokenUseCase(NoParams());
          token.fold((l) {}, (r) async {
            await _socketService.connect(r!.accessToken);
          });
          emit(state.copyWith(status: AuthStatus.authenticated));
        } else {
          emit(state.copyWith(status: AuthStatus.unauthenticated));
        }
      },
    );
  }

  Future<void> logout() async {
    await _socketService.disconnect();
    await _logoutUseCase.call(NoParams());
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }

  Future<void> clearCache() async {
    await _socketService.disconnect();
    await _clearCacheUseCase.call(NoParams());
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }
}

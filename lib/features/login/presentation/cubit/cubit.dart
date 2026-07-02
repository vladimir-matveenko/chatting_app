import 'package:chatting_app/features/login/domain/usecases/login_usecase.dart';
import 'package:chatting_app/features/login/presentation/cubit/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';

@lazySingleton
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginState());
  final LoginUseCase _loginUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(status: LoginStatus.inProgress));
    final result = await _loginUseCase(
      LoginParams(email: email, password: password),
    );
    result.fold(
      (l) {
        String message = 'errors.authError'.tr();
        if (l is InvalidCredentialsFailure) {
          message = 'errors.wrongEmailOrPassword'.tr();
        } else if (l is ServerFailure) {
          message = 'errors.serverError'.tr();
        }
        emit(state.copyWith(error: message, status: LoginStatus.failure));
      },
      (r) {
        emit(state.copyWith(status: LoginStatus.success));
      },
    );
  }
}

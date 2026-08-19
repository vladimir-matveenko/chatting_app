import 'package:chatting_app/features/reset_password/domain/usecases/request_code_usecase.dart';
import 'package:chatting_app/features/reset_password/domain/usecases/reset_password_usecase.dart';
import 'package:chatting_app/features/reset_password/domain/usecases/validate_code_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/presentation/widgets/countdown_timer.dart';
import 'state.dart';

@lazySingleton
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(
    this._requestCodeUseCase,
    this._validateCodeUseCase,
    this._resetPasswordUseCase,
  ) : super(const ResetPasswordState());
  final RequestCodeUseCase _requestCodeUseCase;
  final ValidateCodeUseCase _validateCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final emailController = TextEditingController();
  final validateCodeTimerController = CountdownController();
  final requestCodeTimerController = CountdownController();

  @override
  Future<void> close() async {
    emailController.dispose();
    validateCodeTimerController.dispose();
    requestCodeTimerController.dispose();
    return super.close();
  }

  Future<void> requestCode() async {
    emit(state.copyWith(isLoading: true));

    final result = await _requestCodeUseCase(
      RequestCodeParams(emailController.text),
    );

    result.fold(
      (l) {
        validateCodeTimerController.stop();
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        requestCodeTimerController.start(60);
        validateCodeTimerController.start(180);
        emit(
          state.copyWith(
            isLoading: false,
            status: ResetPasswordStatus.validateCode,
          ),
        );
      },
    );
  }

  Future<void> validateCode({
    required String email,
    required String code,
  }) async {
    emit(state.copyWith(isLoading: true));

    final result = await _validateCodeUseCase(
      ValidateCodeParams(email: email, code: code),
    );

    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            isLoading: false,
            status: ResetPasswordStatus.setPassword,
            resetToken: r,
          ),
        );
      },
    );
  }

  Future<void> setPassword(String password) async {
    emit(state.copyWith(isLoading: true));

    final result = await _resetPasswordUseCase(
      ResetPasswordParams(
        resetToken: state.resetToken ?? '',
        password: password,
      ),
    );

    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        emailController.clear();
        emit(
          state.copyWith(
            isLoading: false,
            status: ResetPasswordStatus.success,
            resetToken: null,
            error: null,
          ),
        );
      },
    );
  }

  Future<void> disableError() async {
    emit(state.copyWith(error: null));
  }

  Future<void> disableSuccess() async {
    emit(
      state.copyWith(status: ResetPasswordStatus.requestCode, resetToken: null),
    );
  }
}

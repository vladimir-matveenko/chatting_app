import 'package:chatting_app/core/presentation/widgets/app_loader.dart';
import 'package:chatting_app/core/presentation/widgets/countdown_timer.dart';
import 'package:chatting_app/features/reset_password/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/reset_password/presentation/widgets/back_to_login_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/presentation/widgets/pin_code_field.dart';

class ValidateCodeBody extends StatefulWidget {
  const ValidateCodeBody({super.key});

  @override
  State<ValidateCodeBody> createState() => _ValidateCodeBodyState();
}

class _ValidateCodeBodyState extends State<ValidateCodeBody> {
  late ResetPasswordCubit cubit;
  final _codeController = PinInputController();

  void _onValidateTapped(String code) {
    cubit.validateCode(email: cubit.emailController.text, code: code);
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<ResetPasswordCubit>();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ResetPasswordCubit>().state;
    final isLoading = state.isLoading;
    return Center(
      child: Stack(
        alignment: .center,
        children: [
          Padding(
            padding: const .symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: .min,
              mainAxisAlignment: .start,
              crossAxisAlignment: .stretch,
              spacing: 16.0,
              children: [
                CountdownTimer(controller: cubit.validateCodeTimerController),
                PinCodeField(
                  errorText: state.error,
                  controller: _codeController,
                  length: 6,
                  onCompleted: (code) {
                    _onValidateTapped(code);
                  },
                ),
                SizedBox(
                  height: 32.0,
                  child: Row(
                    spacing: 4.0,
                    mainAxisAlignment: .center,
                    children: [
                      CountdownTimer(
                        controller: cubit.requestCodeTimerController,
                        prefixWidget: Text(
                          '${'resetPasswordScreen.resendCode'.tr()}:',
                        ),
                        onFinishedPlaceholder: OutlinedButton(
                          onPressed: cubit.requestCode,
                          child: Text('resetPasswordScreen.btnRequest'.tr()),
                        ),
                      ),
                    ],
                  ),
                ),
                const BackToLoginButton(),
              ],
            ),
          ),
          if (isLoading) const Positioned.fill(child: AppLoader()),
        ],
      ),
    );
  }
}

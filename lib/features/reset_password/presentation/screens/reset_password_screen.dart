import 'package:chatting_app/features/reset_password/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/reset_password/presentation/cubit/state.dart';
import 'package:chatting_app/features/reset_password/presentation/widgets/validate_code_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/presentation/widgets/app_back_button.dart';
import '../../../../core/presentation/widgets/app_dialog.dart';
import '../widgets/change_password_body.dart';
import '../widgets/request_code_body.dart';
import '../widgets/reset_password_screen_wrapper.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();
    final state = context.watch<ResetPasswordCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('resetPasswordScreen.screenName'.tr()),
        centerTitle: true,
        leading: AppBackButton(
          onTap: state.status != ResetPasswordStatus.requestCode
              ? cubit.disableSuccess
              : null,
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: ResetPasswordScreenWrapper(
        successMessage: '',
        buildBody: (context, state) {
          if (state.status == ResetPasswordStatus.requestCode) {
            return const RequestCodeBody();
          }
          if (state.status == ResetPasswordStatus.validateCode) {
            return const ValidateCodeBody();
          }
          return const ChangePasswordBody();
        },
        onJobDone: () {},
        onSuccess: () {
          AppDialog.empty(
            context,
            onClose: () {
              context.pop();
            },
            content: Container(
              padding: const .all(32.0),
              constraints: AppUtils.getModalDialogConstraints(context),
              child: Column(
                crossAxisAlignment: .center,
                mainAxisSize: .min,
                spacing: 16.0,
                children: [
                  const Icon(Icons.check, color: Colors.green, size: 60.0),
                  Text('resetPasswordScreen.successMessage'.tr()),
                  ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('okText'.tr()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

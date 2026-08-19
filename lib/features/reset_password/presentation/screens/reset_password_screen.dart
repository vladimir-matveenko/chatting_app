import 'package:chatting_app/app/utils/extensions.dart';
import 'package:chatting_app/core/presentation/widgets/disable_back_navigation.dart';
import 'package:chatting_app/features/reset_password/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/reset_password/presentation/cubit/state.dart';
import 'package:chatting_app/features/reset_password/presentation/widgets/success_body.dart';
import 'package:chatting_app/features/reset_password/presentation/widgets/validate_code_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/app_back_button.dart';
import '../../../../core/presentation/widgets/app_message.dart';
import '../widgets/change_password_body.dart';
import '../widgets/request_code_body.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late ResetPasswordCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ResetPasswordCubit>();
    cubit.emailController.clear();
  }

  @override
  void deactivate() {
    cubit.disableSuccess();
    super.deactivate();
  }

  Widget getBody(ResetPasswordStatus status) {
    return switch (status) {
      ResetPasswordStatus.requestCode => const RequestCodeBody(),
      ResetPasswordStatus.validateCode => const ValidateCodeBody(),
      ResetPasswordStatus.setPassword => const ChangePasswordBody(),
      ResetPasswordStatus.success => const SuccessBody(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state.error?.isNotEmpty == true && !state.status.isValidateCode) {
          AppMessage.error(
            context,
            message: state.error!,
            onClose: () {
              context.read<ResetPasswordCubit>().disableError();
            },
          );
        }
      },
      builder: (context, state) {
        return DisableBackNavigation(
          child: Scaffold(
            appBar: AppBar(
              title: Text('resetPasswordScreen.screenName'.tr()),
              centerTitle: true,
              leading: state.status.isRequestCode
                  ? const AppBackButton()
                  : const SizedBox(),
            ),
            resizeToAvoidBottomInset: true,
            body: getBody(state.status),
          ),
        );
      },
    );
  }
}

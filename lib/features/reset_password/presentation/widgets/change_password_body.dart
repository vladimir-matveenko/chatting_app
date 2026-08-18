import 'package:chatting_app/features/reset_password/presentation/cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile/presentation/widgets/change_password_form.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  late ResetPasswordCubit cubit;
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final obscureCurrent = ValueNotifier<bool>(true);
  final obscureNew = ValueNotifier<bool>(true);
  bool jobDone = false;

  void _onSaveTapped() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    cubit.setPassword(_newPasswordController.text);
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<ResetPasswordCubit>();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ResetPasswordCubit>().state;
    final isLoading = state.isLoading;
    final isBlocked = jobDone;
    return Center(
      child: Padding(
        padding: const .symmetric(horizontal: 16.0),
        child: ChangePasswordForm(
          isFormActive: !isLoading && !isBlocked,
          isLoading: isLoading,
          formKey: _formKey,
          currentPasswordController: _currentPasswordController,
          newPasswordController: _newPasswordController,
          currentPasswordHint: 'resetPasswordScreen.fieldPassword'.tr(),
          newPasswordHint: 'resetPasswordScreen.fieldRepeatPassword'.tr(),
          onSaveTapped: _onSaveTapped,
          mainButtonText: 'changePasswordScreen.btnSave'.tr(),
          obscureCurrent: obscureCurrent,
          obscureNew: obscureNew,
          onObscureCurrentChanged: (value) {
            obscureCurrent.value = value;
          },
          onObscureNewChanged: (value) {
            obscureNew.value = value;
          },
          newPasswordValidator: (value) {
            if (value != _currentPasswordController.text) {
              return 'fieldValidation.mustEquals'.tr();
            }
            return null;
          },
        ),
      ),
    );
  }
}

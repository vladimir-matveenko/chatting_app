import 'package:chatting_app/features/profile/presentation/change_password_cubit/cubit.dart';
import 'package:chatting_app/features/profile/presentation/widgets/change_password_screen_wrapper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/extensions.dart';
import 'change_password_form.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  late ChangePasswordCubit cubit;
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
    cubit.changePassword(
      currentPassword: _currentPasswordController.text,
      newPassword: _newPasswordController.text,
    );
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<ChangePasswordCubit>();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.sizeOf(context);
    final isLandscape = context.isLandscape();
    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ChangePasswordScreenWrapper(
        successMessage: 'changePasswordScreen.changed'.tr(),
        buildBody: (context, state) {
          final isLoading = state.isLoading;
          final isBlocked = jobDone;
          return Container(
            padding: const .all(32.0),
            constraints: BoxConstraints(
              maxHeight: isLandscape
                  ? screenSize.height - 32.0
                  : screenSize.height * 0.8,
              maxWidth: isLandscape
                  ? screenSize.height * 0.8
                  : screenSize.width - 32.0,
            ),
            child: ChangePasswordForm(
              isFormActive: !isLoading && !isBlocked,
              isLoading: isLoading,
              formKey: _formKey,
              currentPasswordController: _currentPasswordController,
              newPasswordController: _newPasswordController,
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
            ),
          );
        },
        onJobDone: () {
          jobDone = true;
        },
        onSuccess: () {
          context.pop();
        },
      ),
    );
  }
}

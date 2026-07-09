import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/app_loader.dart';
import '../../../../core/presentation/widgets/text_fields/password_field.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({
    super.key,
    required this.isFormActive,
    required this.isLoading,
    required this.formKey,
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.onSaveTapped,
    required this.mainButtonText,
    required this.obscureCurrent,
    required this.obscureNew,
    required this.onObscureCurrentChanged,
    required this.onObscureNewChanged,
  });

  final bool isFormActive;
  final bool isLoading;
  final GlobalKey<FormState> formKey;
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final VoidCallback onSaveTapped;
  final String mainButtonText;
  final ValueNotifier<bool> obscureCurrent;
  final ValueNotifier<bool> obscureNew;
  final Function(bool) onObscureCurrentChanged;
  final Function(bool) onObscureNewChanged;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: .min,
        mainAxisAlignment: .start,
        crossAxisAlignment: .stretch,
        spacing: 16.0,
        children: [
          PasswordTextField(
            enabled: isFormActive,
            passwordController: currentPasswordController,
            obscure: obscureCurrent,
            onObscureChanged: onObscureCurrentChanged,
            hintText: 'changePasswordScreen.currentPasField'.tr(),
          ),
          PasswordTextField(
            enabled: isFormActive,
            passwordController: newPasswordController,
            obscure: obscureNew,
            onObscureChanged: onObscureNewChanged,
            hintText: 'changePasswordScreen.newPasField'.tr(),
          ),
          ElevatedButton(
            onPressed: !isFormActive ? null : onSaveTapped,
            child: isLoading ? AppLoader.small() : Text(mainButtonText),
          ),
        ],
      ),
    );
  }
}

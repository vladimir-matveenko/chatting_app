import 'package:chatting_app/core/presentation/widgets/app_dialog.dart';
import 'package:chatting_app/core/presentation/widgets/text_fields/email_text_field.dart';
import 'package:chatting_app/core/presentation/widgets/text_fields/username_text_field.dart';
import 'package:chatting_app/features/profile/presentation/widgets/change_password_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/app_loader.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
    required this.isFormActive,
    required this.isLoading,
    required this.formKey,
    required this.userNameController,
    required this.displayNameController,
    required this.emailController,
    required this.onSaveTapped,
    required this.mainButtonText,
  });

  final bool isFormActive;
  final bool isLoading;
  final GlobalKey<FormState> formKey;
  final TextEditingController userNameController;
  final TextEditingController displayNameController;
  final TextEditingController emailController;
  final VoidCallback onSaveTapped;
  final String mainButtonText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: .only(
          top: 24.0,
          left: 24.0,
          right: 24.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .stretch,
            spacing: 16.0,
            children: [
              UsernameTextField(
                enabled: isFormActive,
                userNameController: userNameController,
                validator: (value) {
                  return null;
                },
              ),
              UsernameTextField(
                enabled: isFormActive,
                userNameController: displayNameController,
                hintText: 'editProfileScreen.fieldDisplayName'.tr(),
              ),
              EmailTextField(
                enabled: isFormActive,
                emailController: emailController,
              ),
              OutlinedButton(
                onPressed: () {
                  AppDialog.empty(
                    context,
                    content: const ChangePasswordDialog(),
                  );
                },
                child: Text('editProfileScreen.btnChangePass'.tr()),
              ),
              ElevatedButton(
                onPressed: !isFormActive ? null : onSaveTapped,
                child: isLoading ? AppLoader.small() : Text(mainButtonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

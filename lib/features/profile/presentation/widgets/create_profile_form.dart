import 'package:chatting_app/core/presentation/widgets/text_fields/email_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/app_loader.dart';
import '../../../../core/presentation/widgets/text_fields/password_field.dart';
import '../../../../core/presentation/widgets/text_fields/username_text_field.dart';

class CreateProfileForm extends StatelessWidget {
  const CreateProfileForm({
    super.key,
    required this.isFormActive,
    required this.isLoading,
    required this.formKey,
    required this.userNameController,
    required this.emailController,
    required this.passwordController,
    required this.onSaveTapped,
    required this.mainButtonText,
    required this.obscure,
    required this.onObscureChanged,
  });

  final bool isFormActive;
  final bool isLoading;
  final GlobalKey<FormState> formKey;
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSaveTapped;
  final String mainButtonText;
  final ValueNotifier<bool> obscure;
  final Function(bool) onObscureChanged;

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
              ),
              EmailTextField(
                enabled: isFormActive,
                emailController: emailController,
              ),
              PasswordTextField(
                enabled: isFormActive,
                passwordController: passwordController,
                obscure: obscure,
                onObscureChanged: onObscureChanged,
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

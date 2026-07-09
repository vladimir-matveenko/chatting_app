import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app_text_form_field.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({
    super.key,
    required this.enabled,
    required this.userNameController,
    this.hintText,
  });

  final bool enabled;
  final TextEditingController userNameController;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: userNameController,
      enabled: enabled,
      keyboardType: .name,
      decoration: InputDecoration(
        hintText: hintText ?? 'createProfileScreen.fieldUserName'.tr(),
        prefixIcon: const Icon(Icons.person),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'fieldValidation.fieldIsRequired'.tr();
        }
        return null;
      },
    );
  }
}

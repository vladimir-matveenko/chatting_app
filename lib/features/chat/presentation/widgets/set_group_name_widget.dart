import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/text_fields/app_text_form_field.dart';

class SetGroupNameWidget extends StatelessWidget {
  const SetGroupNameWidget({
    super.key,
    required this.controller,
    required this.onTap,
  });

  final TextEditingController controller;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.0,
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            fixedSize: const Size(60.0, 60.0),
            padding: const .all(10.0),
          ),
          child: const Icon(Icons.add_a_photo, size: 24.0,),
        ),
        Expanded(child: AppTextFormField(controller: controller)),
      ],
    );
  }
}

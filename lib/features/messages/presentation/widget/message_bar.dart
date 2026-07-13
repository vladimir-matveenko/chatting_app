import 'package:chatting_app/core/presentation/widgets/text_fields/app_text_form_field.dart';
import 'package:flutter/material.dart';

class MessageBar extends StatelessWidget {
  const MessageBar({
    super.key,
    required this.onSend,
    required this.messageController,
  });

  final TextEditingController messageController;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      child: Row(
        spacing: 8.0,
        children: [
          Expanded(
            child: AppTextFormField(controller: messageController, maxLines: 5),
          ),
          ElevatedButton(
            onPressed: onSend,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const .all(8.0),
            ),
            child: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}

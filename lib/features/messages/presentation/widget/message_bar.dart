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
    return Padding(
      padding: const .only(bottom: 16.0),
      child: Row(
        spacing: 8.0,
        crossAxisAlignment: .end,
        children: [
          Expanded(
            child: AppTextFormField(
              controller: messageController,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
            ),
          ),
          Padding(
            padding: const .only(bottom: 8.0),
            child: SizedBox(
              width: 32.0,
              height: 32.0,
              child: ElevatedButton(
                onPressed: onSend,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: .zero,
                ),
                child: const Icon(Icons.send, size: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

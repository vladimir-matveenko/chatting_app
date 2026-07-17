import 'package:chatting_app/core/presentation/widgets/text_fields/app_text_form_field.dart';
import 'package:chatting_app/features/messages/presentation/cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageBar extends StatelessWidget {
  const MessageBar({
    super.key,
    required this.onSend,
    required this.messageController,
    required this.onCancel,
  });

  final TextEditingController messageController;
  final VoidCallback onSend;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MessagesCubit>().state;
    return Padding(
      padding: const .only(bottom: 16.0),
      child: Column(
        children: [
          if (state.editModeActive)
            Padding(
              padding: const .only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: .end,
                children: [
                  Text('chatScreen.editingMode'.tr()),
                  IconButton(
                    onPressed: onCancel,
                    icon: const Icon(
                      Icons.close,
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          Row(
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
        ],
      ),
    );
  }
}

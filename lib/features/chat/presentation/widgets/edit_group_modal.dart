import 'package:chatting_app/core/presentation/widgets/app_back_button.dart';
import 'package:chatting_app/features/chat/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/chat/presentation/widgets/set_group_name_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/utils/app_utils.dart';
import '../cubit/state.dart';

class EditGroupModal extends StatefulWidget {
  const EditGroupModal({super.key});

  @override
  State<EditGroupModal> createState() => _EditGroupModalState();
}

class _EditGroupModalState extends State<EditGroupModal> {
  late ChatCubit cubit;
  final _controller = TextEditingController();
  String oldName = '';

  @override
  void initState() {
    cubit = context.read<ChatCubit>();
    _controller.text = cubit.state.chat?.title ?? '';
    oldName = _controller.text;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<ChatCubit, ChatState>(
      listenWhen: (previous, current) =>
          previous.closeModal != current.closeModal && current.closeModal,
      listener: (context, state) {
        if (state.closeModal) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.canPop()) {
              context.pop();
            }
          });
        }
      },
      child: Container(
        padding: const .all(16.0),
        constraints: AppUtils.getModalDialogConstraints(context),
        child: Column(
          spacing: 16.0,
          mainAxisSize: .min,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                const AppBackButton(),
                Text('change'.tr(), style: theme.textTheme.bodyLarge),
                IconButton(
                  onPressed: () {
                    _controller.text.trim();
                    if (oldName != _controller.text) {
                      cubit.updateChat(
                        chatId: cubit.state.chat?.id ?? '',
                        title: _controller.text,
                      );
                    } else {
                      context.pop();
                    }
                  },
                  icon: const Icon(Icons.check, size: 24.0),
                ),
              ],
            ),
            SetGroupNameWidget(controller: _controller, onTap: () {}),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/presentation/widgets/app_dialog.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import 'edit_group_block.dart';

class EditChatButton extends StatelessWidget {
  const EditChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return state.chat?.type == ChatType.group
            ? Padding(
                padding: const .only(right: 8.0),
                child: IconButton(
                  onPressed: () {
                    AppDialog.empty(
                      context,
                      content: const EditGroupBlock(),
                      onClose: cubit.disableCloseModal,
                    );
                  },
                  icon: const Icon(Icons.edit, size: 20.0),
                ),
              )
            : const SizedBox();
      },
    );
  }
}

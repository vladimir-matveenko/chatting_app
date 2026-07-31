import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/core/presentation/widgets/base_list_view.dart';
import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/widgets/app_loader.dart';
import '../../../../core/presentation/widgets/app_message.dart';
import '../../../messages/presentation/cubit/cubit.dart';
import '../../../messages/presentation/cubit/state.dart';
import 'pinned_message_item.dart';

class PinnedMessagesModal extends StatelessWidget {
  const PinnedMessagesModal({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MessagesCubit>();
    return Container(
      padding: const .all(16.0),
      constraints: AppUtils.getModalDialogConstraints(context),
      child: BlocConsumer<MessagesCubit, MessagesState>(
        builder: (context, state) {
          final isLoading = state.isLoading;
          return isLoading
              ? const Center(child: AppLoader())
              : BaseListView<MessageEntity>(
                  items: state.pinnedMessages,
                  itemBuilder: (context, index) {
                    final item = state.pinnedMessages[index];
                    return PinnedMessageItem(
                      message: item,
                      onNavigateTap: (message) {
                        cubit.getAroundContext(
                          chatId: item.chatId,
                          message: item,
                          closeModal: true,
                        );
                      },
                      onUnpinTap: (message) {
                        cubit.unpinMessage(
                          item.id,
                          closeModal: state.pinnedMessages.length == 1,
                        );
                      },
                    );
                  },
                );
        },
        listener: (context, state) {
          if (state.error?.isNotEmpty == true) {
            AppMessage.error(
              context,
              message: state.error!,
              onClose: cubit.disableError,
            );
          }
          if (state.closeModal) {
            if (context.canPop()) {
              context.pop();
            }
          }
        },
      ),
    );
  }
}

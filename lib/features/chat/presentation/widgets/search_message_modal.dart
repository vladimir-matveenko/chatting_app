import 'package:chatting_app/core/presentation/widgets/base_list_view.dart';
import 'package:chatting_app/features/chat/presentation/widgets/search_result_item.dart';
import 'package:chatting_app/features/messages/domain/entity/message_search_result_entity.dart';
import 'package:chatting_app/features/messages/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/messages/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/utils/app_utils.dart';

class SearchMessageModal extends StatelessWidget {
  const SearchMessageModal({super.key, required this.chatId});

  final String chatId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MessagesCubit>();
    final theme = Theme.of(context);

    return Container(
      constraints: AppUtils.getModalDialogConstraints(context),
      padding: const .all(16.0),
      child: BlocConsumer<MessagesCubit, MessagesState>(
        listenWhen: (prev, current) =>
            prev.closeModal != current.closeModal && current.closeModal,
        listener: (context, state) {
          if (state.closeModal) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.canPop()) {
                context.pop();
              }
            });
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: .min,
            children: [
              SizedBox(
                height: 40.0,
                child: SearchBar(
                  leading: Icon(
                    Icons.search,
                    color: theme.colorScheme.onPrimary,
                  ),
                  onTapOutside: (PointerDownEvent event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  onChanged: (query) {
                    cubit.searchMessages(chatId: chatId, query: query);
                  },
                ),
              ),
              Expanded(
                child: BaseListView<MessageSearchResultEntity>(
                  items: state.searchResults,
                  itemBuilder: (context, index) {
                    final item = state.searchResults[index];
                    return SearchResultItem(
                      item: item,
                      onTap: () {
                        cubit.getAroundContext(
                          chatId: chatId,
                          messageId: item.messageId,
                          closeModal: true,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:chatting_app/core/presentation/widgets/app_loader.dart';
import 'package:chatting_app/core/presentation/widgets/base_list_view.dart';
import 'package:chatting_app/features/chat/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/notifications/presentation/widgets/notification_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/utils/extensions.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();
    final dateFormatter = context.dateFormatter;
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        final isLoading = state.isLoading;
        return isLoading
            ? const AppLoader()
            : state.notifications.isNotEmpty
            ? BaseListView(
                items: state.notifications,
                itemBuilder: (context, index) {
                  final item = state.notifications[index];

                  final current = item.createdAt;
                  final previous = index > 0
                      ? state.notifications[index - 1].createdAt
                      : null;
                  final shouldShowDate =
                      previous == null || !current.isSameDay(previous);

                  return KeyedSubtree(
                    key: ValueKey(item.id),
                    child: Column(
                      children: [
                        if (shouldShowDate)
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 12.0,
                              top: 12.0,
                            ),
                            child: Align(
                              alignment: .center,
                              child: Text(dateFormatter.format(item.createdAt)),
                            ),
                          ),
                        NotificationItem(
                          onTap: () {
                            final chatId = item.payload.chatId ?? '';
                            final messageId = item.payload.messageId;
                            if (chatId.isNotEmpty) {
                              context.read<ChatCubit>().getChatById(chatId);
                              context.go(
                                '${AppRoutes.chats}/$chatId',
                                extra: messageId,
                              );
                            }
                          },
                          slideableAction: () {
                            cubit.markOneAsRead(item.id);
                          },
                          notification: item,
                        ),
                      ],
                    ),
                  );
                },
              )
            : Center(child: Text('notificationsScreen.noNotifications'.tr()));
      },
    );
  }
}

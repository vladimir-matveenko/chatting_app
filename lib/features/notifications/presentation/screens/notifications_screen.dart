import 'package:chatting_app/core/presentation/widgets/app_loader.dart';
import 'package:chatting_app/features/notifications/presentation/widgets/type_filter_block.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../widgets/notifications_list.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        final isLoading = state.isLoading;
        return Column(
          children: [
            TypeFilterBlock(
              availabilityFilters: state.filters,
              onChangeFilter: (filter) {
                cubit.addFilter(filter);
              },
              onDisableFilters: cubit.disableFilters,
            ),
            if (isLoading)
              const Center(child: AppLoader())
            else if (state.notifications.isNotEmpty)
              NotificationsList(notifications: state.notifications)
            else
              Expanded(
                child: Center(
                  child: Text('notificationsScreen.noNotifications'.tr()),
                ),
              ),
          ],
        );
      },
    );
  }
}

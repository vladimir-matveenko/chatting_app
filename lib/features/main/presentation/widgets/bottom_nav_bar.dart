import 'package:chatting_app/features/notifications/presentation/cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTap,
  });

  final int currentIndex;
  final Function(int index) onItemTap;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NotificationsCubit>().state;
    final theme = Theme.of(context);
    return Builder(
      key: ValueKey(context.locale),
      builder: (context) {
        return BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onItemTap,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: 'bottomNavBar.contacts'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.forum),
              label: 'bottomNavBar.chats'.tr(),
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  const Icon(Icons.notifications),
                  if (state.unreadCount > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 6.0,
                        height: 6.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                ],
              ),
              label: 'bottomNavBar.notifications'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              label: 'bottomNavBar.profile'.tr(),
            ),
          ],
        );
      },
    );
  }
}

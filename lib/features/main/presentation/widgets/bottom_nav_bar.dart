import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
              icon: const Icon(Icons.account_circle),
              label: 'bottomNavBar.profile'.tr(),
            ),
          ],
        );
      },
    );
  }
}

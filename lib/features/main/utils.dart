import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router/app_routes.dart';

class MainScreenUtils {
  static String getAppBarTitle(BuildContext context) {
    final location = GoRouterState.of(context).uri;
    if (location.pathSegments.length == 2) {
      if (location.pathSegments.last == AppRoutes.editProfile) {
        return 'editProfileScreen.screenName'.tr();
      }
      if (location.pathSegments.first == AppRoutes.chats.replaceAll('/', '')) {
        return 'chatScreen.screenName'.tr();
      }
    }
    return switch (location.toString()) {
      AppRoutes.users => 'contactsScreen.screenName'.tr(),
      AppRoutes.chats => 'chatsScreen.screenName'.tr(),
      AppRoutes.notifications => 'notificationsScreen.screenName'.tr(),
      AppRoutes.profile => 'profileScreen.screenName'.tr(),
      _ => '',
    };
  }

  static bool showBackButton(BuildContext context) {
    final uri = GoRouterState.of(context).uri;
    return uri.pathSegments.length > 1;
  }

  static Widget? getFAB(
    BuildContext context, {
    required VoidCallback action,
    required GoRouterState state,
  }) {
    final location = state.uri.path;
    return switch (location) {
      AppRoutes.chats => FloatingActionButton(
        onPressed: action,
        child: const Icon(Icons.add),
      ),
      _ => null,
    };
  }
}

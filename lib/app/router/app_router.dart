import 'dart:async';

import 'package:chatting_app/features/chats/presentation/screens/chats_screen.dart';
import 'package:chatting_app/features/contacts/presentation/screens/contacts_screen.dart';
import 'package:chatting_app/features/login/presentation/screens/login_screen.dart';
import 'package:chatting_app/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../core/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/cubit/cubit.dart';
import '../../features/auth/presentation/cubit/state.dart';
import '../../features/main/presentation/main_screen.dart';
import '../../features/profile/presentation/screens/create_profile_screen.dart';
import '../../features/profile/presentation/screens/edit_profile_screen.dart';
import '../../features/profile/presentation/screens/licences_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import 'app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@lazySingleton
class AppRouter {
  AppRouter(this.cubit);

  final AuthCubit cubit;

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    navigatorKey: _rootNavigatorKey,
    refreshListenable: GoRouterRefreshStream(cubit.stream),
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      final status = cubit.state.status;

      final isSplash = state.matchedLocation == AppRoutes.splash;
      final isLogin = state.matchedLocation == AppRoutes.login;
      final isCreateProfile = state.matchedLocation == AppRoutes.createProfile;

      if (status == AuthStatus.unknown) {
        return null;
      }

      if (status == AuthStatus.unauthenticated) {
        if (isCreateProfile || isLogin) {
          return null;
        }
        return AppRoutes.login;
      }

      if (status == AuthStatus.authenticated) {
        if (isSplash || isCreateProfile || isLogin) {
          return AppRoutes.chats;
        }
        return null;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SplashScreen()),
      ),
      GoRoute(
        path: AppRoutes.login,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: LoginScreen()),
      ),
      GoRoute(
        path: AppRoutes.createProfile,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: CreateProfileScreen()),
      ),
      GoRoute(
        path: AppRoutes.licenses,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: LicensesScreen()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell, state: state);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.contacts,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ContactsScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.chats,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ChatsScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.notifications,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: NotificationsScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            preload: true,
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfileScreen()),
                routes: [
                  GoRoute(
                    path: AppRoutes.editProfile,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: EditProfileScreen()),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

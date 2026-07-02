import 'dart:async';

import 'package:chatting_app/features/chats/presentation/pages/chats_page.dart';
import 'package:chatting_app/features/contacts/presentation/pages/contacts_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../core/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/cubit/cubit.dart';
import '../../features/auth/presentation/cubit/state.dart';
import '../../features/main/presentation/main_screen.dart';
import '../../features/profile/presentation/pages/create_profile_page.dart';
import '../../features/profile/presentation/pages/edit_profile_page.dart';
import '../../features/profile/presentation/pages/licences_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
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
      final isCreateProfile = state.matchedLocation == AppRoutes.createProfile;

      if (status == AuthStatus.unknown) {
        return null;
      }

      if (status == AuthStatus.unauthenticated) {
        if (isCreateProfile) {
          return null;
        }
        return AppRoutes.createProfile;
      }

      if (status == AuthStatus.authenticated) {
        if (isSplash || isCreateProfile) {
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
            const NoTransitionPage(child: SplashPage()),
      ),
      GoRoute(
        path: AppRoutes.createProfile,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: CreateProfilePage()),
      ),
      GoRoute(
        path: AppRoutes.licenses,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: LicensesPage()),
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
                    const NoTransitionPage(child: ContactsPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.chats,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ChatsPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            preload: true,
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfilePage()),
                routes: [
                  GoRoute(
                    path: AppRoutes.editProfile,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: EditProfilePage()),
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

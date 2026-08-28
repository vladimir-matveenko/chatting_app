import 'dart:async';

import 'package:chatting_app/app/constants/asset_paths.dart';
import 'package:chatting_app/app/router/app_routes.dart';
import 'package:chatting_app/features/auth/domain/entity/user_entity.dart';
import 'package:chatting_app/features/auth/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/auth/presentation/cubit/state.dart';
import 'package:chatting_app/features/login/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/login/presentation/cubit/state.dart';
import 'package:chatting_app/features/profile/presentation/profile_cubit/cubit.dart';
import 'package:chatting_app/features/profile/presentation/profile_cubit/state.dart';
import 'package:chatting_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:chatting_app/features/profile/presentation/widgets/language_selector.dart';
import 'package:chatting_app/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:chatting_app/features/profile/presentation/widgets/theme_selector.dart';
import 'package:chatting_app/features/theme/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/theme/presentation/cubit/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockProfileCubit extends Mock implements ProfileCubit {}

class MockAuthCubit extends Mock implements AuthCubit {}

class MockLoginCubit extends Mock implements LoginCubit {}

class MockThemeCubit extends Mock implements ThemeCubit {}

class FakeProfileState extends Fake implements ProfileState {}

class FakeThemeState extends Fake implements ThemeState {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();

  late MockProfileCubit profileCubit;
  late MockAuthCubit authCubit;
  late MockLoginCubit loginCubit;
  late MockThemeCubit themeCubit;

  late StreamController<ProfileState> profileController;
  late StreamController<ThemeState> themeController;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(FakeProfileState());
    registerFallbackValue(FakeThemeState());
  });

  setUp(() {
    profileCubit = MockProfileCubit();
    authCubit = MockAuthCubit();
    loginCubit = MockLoginCubit();
    themeCubit = MockThemeCubit();

    profileController = StreamController<ProfileState>.broadcast();
    themeController = StreamController<ThemeState>.broadcast();

    /// AuthCubit
    when(
      () => authCubit.state,
    ).thenReturn(const AuthState(status: AuthStatus.unknown));

    when(
      () => authCubit.stream,
    ).thenAnswer((_) => const Stream<AuthState>.empty());

    /// LoginCubit
    when(
      () => loginCubit.state,
    ).thenReturn(const LoginState(status: LoginStatus.unknown, error: ''));

    when(
      () => loginCubit.stream,
    ).thenAnswer((_) => const Stream<LoginState>.empty());

    when(
      () => profileCubit.loadProfile(loadSilent: false),
    ).thenAnswer((_) async {});

    when(() => profileCubit.loadProfile()).thenAnswer((_) async {});

    when(() => profileCubit.state).thenReturn(
      ProfileState(
        profile: UserEntity(
          id: '1',
          userName: 'Jhon',
          email: 'john@mail.com',
          avatarUrl: '',
          createdAt: DateTime.now(),
        ),
      ),
    );

    when(() => profileCubit.stream).thenAnswer((_) => profileController.stream);

    when(() => themeCubit.state).thenReturn(const ThemeState());

    when(() => themeCubit.stream).thenAnswer((_) => themeController.stream);

    when(() => authCubit.logout()).thenAnswer((_) async {});

    when(() => loginCubit.onLogout()).thenAnswer((_) async {});
  });

  tearDown(() async {
    await profileController.close();
    await themeController.close();
  });

  GoRouter createRouter() {
    return GoRouter(
      initialLocation: AppRoutes.profile,
      routes: [
        GoRoute(
          path: AppRoutes.profile,
          builder: (context, state) => const Scaffold(body: ProfileScreen()),
          routes: [
            GoRoute(
              path: AppRoutes.editProfile,
              builder: (context, state) =>
                  const Scaffold(body: Text('Edit Profile Screen')),
            ),
          ],
        ),
        GoRoute(
          path: AppRoutes.licenses,
          builder: (context, state) =>
              const Scaffold(body: Text('Licenses Screen')),
        ),
      ],
    );
  }

  Future<void> pumpProfileScreen(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1000));

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<ProfileCubit>.value(value: profileCubit),
          BlocProvider<AuthCubit>.value(value: authCubit),
          BlocProvider<LoginCubit>.value(value: loginCubit),
          BlocProvider<ThemeCubit>.value(value: themeCubit),
        ],
        child: EasyLocalization(
          supportedLocales: const [Locale('en', 'US')],
          startLocale: const Locale('en', 'US'),
          path: AssetPaths.assetTranslationsPath,
          fallbackLocale: const Locale('en', 'US'),
          child: MaterialApp.router(routerConfig: createRouter()),
        ),
      ),
    );

    await tester.pumpAndSettle();
  }

  testWidgets('ProfileScreen displays user info and controls', (
    WidgetTester tester,
  ) async {
    await pumpProfileScreen(tester);

    // Profile is loaded when screen is initialized.
    verify(() => profileCubit.loadProfile(loadSilent: false)).called(1);

    // User information.
    expect(find.byType(ProfileAvatar), findsOneWidget);

    expect(find.text('Jhon'), findsOneWidget);

    expect(find.text('john@mail.com'), findsOneWidget);

    // Theme and language selectors.
    expect(find.byType(ThemeSelector), findsOneWidget);

    expect(find.byType(LanguageSelector), findsOneWidget);

    // Edit profile button.
    expect(find.byIcon(Icons.edit), findsOneWidget);

    // Licenses button.
    expect(find.text('Open Source Licenses'), findsOneWidget);

    // Logout button.
    expect(find.byIcon(Icons.logout), findsOneWidget);
  });

  testWidgets('ProfileScreen logout calls auth and login cubits', (
    WidgetTester tester,
  ) async {
    await pumpProfileScreen(tester);

    final logoutButton = find.byIcon(Icons.logout);

    expect(logoutButton, findsOneWidget);

    await tester.tap(logoutButton);
    await tester.pump();

    verify(() => authCubit.logout()).called(1);

    verify(() => loginCubit.onLogout()).called(1);
  });

  testWidgets('ProfileScreen navigates to edit profile', (
    WidgetTester tester,
  ) async {
    await pumpProfileScreen(tester);

    final editButton = find.byIcon(Icons.edit);

    expect(editButton, findsOneWidget);

    await tester.tap(editButton);
    await tester.pumpAndSettle();

    expect(find.text('Edit Profile Screen'), findsOneWidget);
  });

  testWidgets('ProfileScreen navigates to licenses', (
    WidgetTester tester,
  ) async {
    await pumpProfileScreen(tester);

    final licensesButton = find.text('Open Source Licenses');

    expect(licensesButton, findsOneWidget);

    await tester.tap(licensesButton);
    await tester.pumpAndSettle();

    expect(find.text('Licenses Screen'), findsOneWidget);
  });
}

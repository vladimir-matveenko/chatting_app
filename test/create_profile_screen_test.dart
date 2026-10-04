import 'dart:async';

import 'package:chatting_app/app/constants/asset_paths.dart';
import 'package:chatting_app/core/presentation/widgets/text_fields/password_field.dart';
import 'package:chatting_app/features/profile/presentation/profile_cubit/cubit.dart';
import 'package:chatting_app/features/profile/presentation/profile_cubit/state.dart';
import 'package:chatting_app/features/profile/presentation/screens/create_profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockProfileCubit extends Mock implements ProfileCubit {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();
  late MockProfileCubit profileCubit;
  late StreamController<ProfileState> stateController;
  late ProfileState profileState;
  late GoRouter router;

  setUp(() {
    profileCubit = MockProfileCubit();
    stateController = StreamController<ProfileState>.broadcast();
    profileState = const ProfileState();

    when(() => profileCubit.state).thenReturn(profileState);

    when(() => profileCubit.stream).thenAnswer((_) => stateController.stream);

    when(
      () => profileCubit.createProfile(
        userName: any(named: 'userName'),
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async {});

    router = GoRouter(
      initialLocation: '/create-profile',
      routes: [
        GoRoute(
          path: '/create-profile',
          builder: (context, state) => const CreateProfileScreen(),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(body: Text('Home')),
        ),
      ],
    );
  });

  tearDown(() async {
    await stateController.close();
    router.dispose();
  });

  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru')],
        path: AssetPaths.assetTranslationsPath,
        fallbackLocale: const Locale('en'),
        child: BlocProvider<ProfileCubit>.value(
          value: profileCubit,
          child: MaterialApp.router(routerConfig: router),
        ),
      ),
    );

    await tester.pumpAndSettle();
  }

  group('CreateProfileScreen', () {
    testWidgets('should display screen title and form', (tester) async {
      await pumpScreen(tester);

      expect(find.text('createProfileScreen.screenName'.tr()), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(3));
      expect(find.text('createProfileScreen.btnCreate'.tr()), findsOneWidget);
    });

    testWidgets('should not create profile when form is invalid', (
      tester,
    ) async {
      await pumpScreen(tester);

      await tester.tap(find.text('createProfileScreen.btnCreate'.tr()));
      await tester.pump();

      verifyNever(
        () => profileCubit.createProfile(
          userName: any(named: 'userName'),
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      );
    });

    testWidgets('should create profile with entered credentials', (
      tester,
    ) async {
      await pumpScreen(tester);

      final fields = find.byType(TextFormField);

      await tester.enterText(fields.at(0), 'Vladimir');
      await tester.enterText(fields.at(1), 'test@example.com');
      await tester.enterText(fields.at(2), 'Password123!');

      await tester.tap(find.text('createProfileScreen.btnCreate'.tr()));
      await tester.pump();

      verify(
        () => profileCubit.createProfile(
          userName: 'Vladimir',
          email: 'test@example.com',
          password: 'Password123!',
        ),
      ).called(1);
    });

    testWidgets('should disable form while loading', (tester) async {
      profileState = const ProfileState(isLoading: true);

      when(() => profileCubit.state).thenReturn(profileState);

      await tester.pumpWidget(
        EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ru')],
          path: AssetPaths.assetTranslationsPath,
          fallbackLocale: const Locale('en'),
          child: BlocProvider<ProfileCubit>.value(
            value: profileCubit,
            child: MaterialApp.router(routerConfig: router),
          ),
        ),
      );

      // Don't use pumpAndSettle here.
      await tester.pump();

      final fields = tester.widgetList<TextFormField>(
        find.byType(TextFormField),
      );

      expect(fields.every((field) => field.enabled == false), isTrue);
    });

    testWidgets('should toggle password visibility', (tester) async {
      await pumpScreen(tester);

      final passwordField = find.byType(PasswordTextField);

      expect(passwordField, findsOneWidget);

      expect(
        tester.widget<PasswordTextField>(passwordField).obscure.value,
        isTrue,
      );

      expect(find.byIcon(Icons.lock), findsOneWidget);
      expect(find.byIcon(Icons.lock_open), findsNothing);

      await tester.tap(find.byIcon(Icons.lock));
      await tester.pump();

      expect(
        tester.widget<PasswordTextField>(passwordField).obscure.value,
        isFalse,
      );

      expect(find.byIcon(Icons.lock), findsNothing);
      expect(find.byIcon(Icons.lock_open), findsOneWidget);

      await tester.tap(find.byIcon(Icons.lock_open));
      await tester.pump();

      expect(
        tester.widget<PasswordTextField>(passwordField).obscure.value,
        isTrue,
      );

      expect(find.byIcon(Icons.lock), findsOneWidget);
      expect(find.byIcon(Icons.lock_open), findsNothing);
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:chatting_app/app/constants/app_constants.dart';
import 'package:chatting_app/app/constants/asset_paths.dart';
import 'package:chatting_app/core/presentation/widgets/text_fields/email_text_field.dart';
import 'package:chatting_app/core/presentation/widgets/text_fields/password_field.dart';
import 'package:chatting_app/features/login/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/login/presentation/cubit/state.dart';
import 'package:chatting_app/features/login/presentation/screens/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockLoginCubit extends Mock implements LoginCubit {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();

  late MockLoginCubit mockCubit;

  Widget createWidget() {
    return EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      startLocale: const Locale('en', 'US'),
      path: AssetPaths.assetTranslationsPath,
      fallbackLocale: const Locale('en', 'US'),
      child: MaterialApp(
        home: BlocProvider<LoginCubit>.value(
          value: mockCubit,
          child: const LoginScreen(),
        ),
      ),
    );
  }

  setUp(() {
    mockCubit = MockLoginCubit();

    when(
      () => mockCubit.state,
    ).thenReturn(const LoginState(status: LoginStatus.unknown, error: ''));

    when(() => mockCubit.setInitialParameters()).thenAnswer((_) async {});

    when(
      () => mockCubit.login(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async {});

    whenListen(
      mockCubit,
      Stream<LoginState>.fromIterable([
        const LoginState(status: LoginStatus.unknown, error: ''),
      ]),
      initialState: const LoginState(status: LoginStatus.unknown, error: ''),
    );
  });

  testWidgets('LoginScreen renders correctly', (tester) async {
    await tester.pumpWidget(createWidget());
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
  });

  testWidgets('LoginScreen has email and password fields', (tester) async {
    await tester.pumpWidget(createWidget());
    await tester.pumpAndSettle();

    expect(find.byType(EmailTextField), findsOneWidget);
    expect(find.byType(PasswordTextField), findsOneWidget);
  });

  testWidgets('LoginScreen initializes email and password fields', (
    tester,
  ) async {
    await tester.pumpWidget(createWidget());
    await tester.pumpAndSettle();

    final emailField = find.byType(EmailTextField);
    final passwordField = find.byType(PasswordTextField);

    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);

    final emailTextField = find.descendant(
      of: emailField,
      matching: find.byType(TextFormField),
    );

    final passwordTextField = find.descendant(
      of: passwordField,
      matching: find.byType(TextFormField),
    );

    expect(
      tester.widget<TextFormField>(emailTextField).controller?.text,
      AppConstants.testEmail,
    );

    expect(
      tester.widget<TextFormField>(passwordTextField).controller?.text,
      AppConstants.testPassword,
    );
  });

  testWidgets(
    'LoginScreen has login, create profile and reset password buttons',
    (tester) async {
      await tester.pumpWidget(createWidget());
      await tester.pumpAndSettle();

      expect(
        find.widgetWithText(ElevatedButton, 'loginScreen.btnLogin'.tr()),
        findsOneWidget,
      );

      expect(
        find.widgetWithText(TextButton, 'createProfileScreen.screenName'.tr()),
        findsOneWidget,
      );

      expect(
        find.widgetWithText(
          TextButton,
          '${'loginScreen.forgotPassword'.tr()}?',
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets('Shows loader inside login button when loading', (tester) async {
    when(
      () => mockCubit.state,
    ).thenReturn(const LoginState(status: LoginStatus.inProgress, error: ''));

    whenListen(
      mockCubit,
      Stream<LoginState>.value(
        const LoginState(status: LoginStatus.inProgress, error: ''),
      ),
      initialState: const LoginState(status: LoginStatus.inProgress, error: ''),
    );

    await tester.pumpWidget(createWidget());
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Login button is disabled when loading', (tester) async {
    when(
      () => mockCubit.state,
    ).thenReturn(const LoginState(status: LoginStatus.inProgress, error: ''));

    whenListen(
      mockCubit,
      Stream<LoginState>.value(
        const LoginState(status: LoginStatus.inProgress, error: ''),
      ),
      initialState: const LoginState(status: LoginStatus.inProgress, error: ''),
    );

    await tester.pumpWidget(createWidget());
    await tester.pump();

    final loginButton = tester.widget<ElevatedButton>(
      find.byType(ElevatedButton),
    );

    expect(loginButton.onPressed, isNull);
  });

  testWidgets('Login with valid data triggers login request', (tester) async {
    await tester.pumpWidget(createWidget());
    await tester.pumpAndSettle();

    // Values are already initialized by LoginScreen.initState().
    expect(
      tester
          .widget<TextFormField>(
            find.descendant(
              of: find.byType(EmailTextField),
              matching: find.byType(TextFormField),
            ),
          )
          .controller
          ?.text,
      AppConstants.testEmail,
    );

    expect(
      tester
          .widget<TextFormField>(
            find.descendant(
              of: find.byType(PasswordTextField),
              matching: find.byType(TextFormField),
            ),
          )
          .controller
          ?.text,
      AppConstants.testPassword,
    );

    final loginButton = find.widgetWithText(
      ElevatedButton,
      'loginScreen.btnLogin'.tr(),
    );

    await tester.tap(loginButton);
    await tester.pump();

    verify(
      () => mockCubit.login(
        email: AppConstants.testEmail,
        password: AppConstants.testPassword,
      ),
    ).called(1);
  });

  testWidgets('Calls setInitialParameters when screen is created', (
    tester,
  ) async {
    await tester.pumpWidget(createWidget());
    await tester.pumpAndSettle();

    verify(() => mockCubit.setInitialParameters()).called(1);
  });
}

import 'dart:async';

import 'package:chatting_app/features/profile/presentation/profile_cubit/cubit.dart';
import 'package:chatting_app/features/profile/presentation/profile_cubit/state.dart';
import 'package:chatting_app/features/profile/presentation/widgets/profile_screen_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProfileCubit extends Mock implements ProfileCubit {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockProfileCubit profileCubit;
  late StreamController<ProfileState> stateController;
  late ProfileState profileState;

  setUp(() {
    profileCubit = MockProfileCubit();
    stateController = StreamController<ProfileState>.broadcast();
    profileState = const ProfileState();

    when(() => profileCubit.state).thenReturn(profileState);
    when(() => profileCubit.stream).thenAnswer((_) => stateController.stream);

    when(() => profileCubit.disableError()).thenAnswer((_) async {});
    when(() => profileCubit.disableSuccess()).thenAnswer((_) async {});
  });

  tearDown(() async {
    await stateController.close();
  });

  Future<void> pumpWrapper(
    WidgetTester tester, {
    String successMessage = 'Success!',
    VoidCallback? onJobDone,
    VoidCallback? onSuccess,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ProfileCubit>.value(
          value: profileCubit,
          child: Scaffold(
            body: ProfileScreenWrapper(
              successMessage: successMessage,
              buildBody: (context, state) {
                return Text(state.isLoading ? 'Loading' : 'Profile body');
              },
              onJobDone: onJobDone ?? () {},
              onSuccess: onSuccess ?? () {},
            ),
          ),
        ),
      ),
    );

    await tester.pump();
  }

  Future<void> emitState(WidgetTester tester, ProfileState state) async {
    profileState = state;
    when(() => profileCubit.state).thenReturn(profileState);

    stateController.add(state);

    await tester.pump();
  }

  void closeSnackBar(WidgetTester tester) {
    final context = tester.element(find.byType(Scaffold));

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  group('ProfileScreenWrapper', () {
    testWidgets('should render body', (tester) async {
      await pumpWrapper(tester);

      expect(find.text('Profile body'), findsOneWidget);
    });

    group('error', () {
      testWidgets('shows error message when state contains error', (
        tester,
      ) async {
        when(() => profileCubit.state).thenReturn(const ProfileState());

        when(
          () => profileCubit.stream,
        ).thenAnswer((_) => stateController.stream);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider<ProfileCubit>.value(
                value: profileCubit,
                child: ProfileScreenWrapper(
                  successMessage: '',
                  buildBody: (context, state) {
                    return const SizedBox();
                  },
                  onJobDone: () {},
                  onSuccess: () {},
                ),
              ),
            ),
          ),
        );

        stateController.add(const ProfileState(error: 'Something went wrong'));

        await tester.pump();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Something went wrong'), findsOneWidget);
      });

      testWidgets('should disable error when message is closed', (
        tester,
      ) async {
        await pumpWrapper(tester);

        await emitState(
          tester,
          const ProfileState(error: 'Something went wrong'),
        );

        await tester.pump();

        expect(find.text('Something went wrong'), findsOneWidget);

        closeSnackBar(tester);
        await tester.pumpAndSettle();

        verify(() => profileCubit.disableError()).called(1);
      });
    });

    group('createdSuccessful', () {
      testWidgets('should call onJobDone and show success message', (
        tester,
      ) async {
        var jobDoneCalled = false;
        var successCalled = false;

        await pumpWrapper(
          tester,
          successMessage: 'Profile created successfully',
          onJobDone: () {
            jobDoneCalled = true;
          },
          onSuccess: () {
            successCalled = true;
          },
        );

        await emitState(tester, const ProfileState(createdSuccessful: true));

        await tester.pump();

        expect(jobDoneCalled, isTrue);
        expect(successCalled, isFalse);
        expect(find.text('Profile created successfully'), findsOneWidget);

        verifyNever(() => profileCubit.disableSuccess());
      });

      testWidgets(
        'should disable success and call onSuccess when message is closed',
        (tester) async {
          var jobDoneCalled = false;
          var successCalled = false;

          await pumpWrapper(
            tester,
            successMessage: 'Profile created successfully',
            onJobDone: () {
              jobDoneCalled = true;
            },
            onSuccess: () {
              successCalled = true;
            },
          );

          await emitState(tester, const ProfileState(createdSuccessful: true));

          await tester.pump();

          expect(jobDoneCalled, isTrue);
          expect(successCalled, isFalse);

          closeSnackBar(tester);
          await tester.pumpAndSettle();

          verify(() => profileCubit.disableSuccess()).called(1);
          expect(successCalled, isTrue);
        },
      );
    });

    group('updatedSuccessful', () {
      testWidgets('should call onJobDone and show success message', (
        tester,
      ) async {
        var jobDoneCalled = false;
        var successCalled = false;

        await pumpWrapper(
          tester,
          successMessage: 'Profile updated successfully',
          onJobDone: () {
            jobDoneCalled = true;
          },
          onSuccess: () {
            successCalled = true;
          },
        );

        await emitState(tester, const ProfileState(updatedSuccessful: true));

        await tester.pump();

        expect(jobDoneCalled, isTrue);
        expect(successCalled, isFalse);
        expect(find.text('Profile updated successfully'), findsOneWidget);

        verifyNever(() => profileCubit.disableSuccess());
      });

      testWidgets(
        'should disable success and call onSuccess when message is closed',
        (tester) async {
          var jobDoneCalled = false;
          var successCalled = false;

          await pumpWrapper(
            tester,
            successMessage: 'Profile updated successfully',
            onJobDone: () {
              jobDoneCalled = true;
            },
            onSuccess: () {
              successCalled = true;
            },
          );

          await emitState(tester, const ProfileState(updatedSuccessful: true));

          await tester.pump();

          expect(jobDoneCalled, isTrue);
          expect(successCalled, isFalse);

          closeSnackBar(tester);
          await tester.pumpAndSettle();

          verify(() => profileCubit.disableSuccess()).called(1);
          expect(successCalled, isTrue);
        },
      );
    });

    group('successMessage is empty', () {
      testWidgets(
        'should not show success message and immediately call onSuccess',
        (tester) async {
          var jobDoneCalled = false;
          var successCalled = false;

          await pumpWrapper(
            tester,
            successMessage: '',
            onJobDone: () {
              jobDoneCalled = true;
            },
            onSuccess: () {
              successCalled = true;
            },
          );

          await emitState(tester, const ProfileState(createdSuccessful: true));

          expect(jobDoneCalled, isTrue);
          expect(successCalled, isTrue);

          expect(find.byType(SnackBar), findsNothing);

          verify(() => profileCubit.disableSuccess()).called(1);
        },
      );

      testWidgets('should handle empty success message for updatedSuccessful', (
        tester,
      ) async {
        var jobDoneCalled = false;
        var successCalled = false;

        await pumpWrapper(
          tester,
          successMessage: '',
          onJobDone: () {
            jobDoneCalled = true;
          },
          onSuccess: () {
            successCalled = true;
          },
        );

        await emitState(tester, const ProfileState(updatedSuccessful: true));

        expect(jobDoneCalled, isTrue);
        expect(successCalled, isTrue);

        expect(find.byType(SnackBar), findsNothing);

        verify(() => profileCubit.disableSuccess()).called(1);
      });
    });

    group('success state combinations', () {
      testWidgets(
        'should handle createdSuccessful and updatedSuccessful together',
        (tester) async {
          var jobDoneCalls = 0;
          var successCalls = 0;

          await pumpWrapper(
            tester,
            successMessage: 'Success',
            onJobDone: () {
              jobDoneCalls++;
            },
            onSuccess: () {
              successCalls++;
            },
          );

          await emitState(
            tester,
            const ProfileState(
              createdSuccessful: true,
              updatedSuccessful: true,
            ),
          );

          await tester.pump();

          expect(jobDoneCalls, 1);
          expect(successCalls, 0);
          expect(find.text('Success'), findsOneWidget);

          closeSnackBar(tester);
          await tester.pumpAndSettle();

          verify(() => profileCubit.disableSuccess()).called(1);
          expect(successCalls, 1);
        },
      );
    });

    group('error and success', () {
      testWidgets('should handle error state', (tester) async {
        await pumpWrapper(tester);

        await emitState(tester, const ProfileState(error: 'Request failed'));

        await tester.pump();

        expect(find.text('Request failed'), findsOneWidget);

        closeSnackBar(tester);
        await tester.pumpAndSettle();

        verify(() => profileCubit.disableError()).called(1);
      });

      testWidgets('should handle success after error', (tester) async {
        var successCalled = false;

        await pumpWrapper(
          tester,
          successMessage: 'Created',
          onSuccess: () {
            successCalled = true;
          },
        );

        await emitState(tester, const ProfileState(error: 'Request failed'));

        await tester.pump();

        expect(find.text('Request failed'), findsOneWidget);

        closeSnackBar(tester);
        await tester.pumpAndSettle();

        verify(() => profileCubit.disableError()).called(1);

        await emitState(tester, const ProfileState(createdSuccessful: true));

        await tester.pump();

        expect(find.text('Created'), findsOneWidget);
        expect(successCalled, isFalse);

        closeSnackBar(tester);
        await tester.pumpAndSettle();

        verify(() => profileCubit.disableSuccess()).called(1);
        expect(successCalled, isTrue);
      });
    });
  });
}

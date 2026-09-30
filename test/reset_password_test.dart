import 'package:bloc_test/bloc_test.dart';
import 'package:chatting_app/core/error/failure.dart';
import 'package:chatting_app/features/reset_password/domain/usecases/request_code_usecase.dart';
import 'package:chatting_app/features/reset_password/domain/usecases/reset_password_usecase.dart';
import 'package:chatting_app/features/reset_password/domain/usecases/validate_code_usecase.dart';
import 'package:chatting_app/features/reset_password/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/reset_password/presentation/cubit/state.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock use cases
class MockRequestCodeUseCase extends Mock implements RequestCodeUseCase {}

class MockValidateCodeUseCase extends Mock implements ValidateCodeUseCase {}

class MockResetPasswordUseCase extends Mock implements ResetPasswordUseCase {}

void main() {
  setUpAll(() {
    registerFallbackValue(RequestCodeParams(''));
    registerFallbackValue(ValidateCodeParams(email: '', code: ''));
    registerFallbackValue(ResetPasswordParams(resetToken: '', password: ''));
  });

  group('ResetPasswordCubit', () {
    late MockRequestCodeUseCase mockRequestCodeUseCase;
    late MockValidateCodeUseCase mockValidateCodeUseCase;
    late MockResetPasswordUseCase mockResetPasswordUseCase;

    setUp(() {
      mockRequestCodeUseCase = MockRequestCodeUseCase();
      mockValidateCodeUseCase = MockValidateCodeUseCase();
      mockResetPasswordUseCase = MockResetPasswordUseCase();
    });

    blocTest<ResetPasswordCubit, ResetPasswordState>(
      'emits [loading, validateCode] when requestCode succeeds',
      build: () => ResetPasswordCubit(
        mockRequestCodeUseCase,
        mockValidateCodeUseCase,
        mockResetPasswordUseCase,
      ),
      act: (cubit) async {
        when(
          () => mockRequestCodeUseCase(any()),
        ).thenAnswer((_) async => const Right(true));
        cubit.emailController.text = 'test@example.com';
        await cubit.requestCode();
      },
      expect: () => [
        const ResetPasswordState(isLoading: true),
        const ResetPasswordState(
          isLoading: false,
          status: ResetPasswordStatus.validateCode,
        ),
      ],
    );

    blocTest<ResetPasswordCubit, ResetPasswordState>(
      'emits [loading, error] when requestCode fails',
      build: () => ResetPasswordCubit(
        mockRequestCodeUseCase,
        mockValidateCodeUseCase,
        mockResetPasswordUseCase,
      ),
      act: (cubit) async {
        when(
          () => mockRequestCodeUseCase(any()),
        ).thenAnswer((_) async => Left(ServerFailure(message: 'Error')));
        cubit.emailController.text = 'test@example.com';
        await cubit.requestCode();
      },
      expect: () => [
        const ResetPasswordState(isLoading: true),
        ResetPasswordState(isLoading: false, error: 'errors.serverError'.tr()),
      ],
    );

    blocTest<ResetPasswordCubit, ResetPasswordState>(
      'emits [loading, setPassword] when validateCode succeeds',
      build: () => ResetPasswordCubit(
        mockRequestCodeUseCase,
        mockValidateCodeUseCase,
        mockResetPasswordUseCase,
      ),
      act: (cubit) async {
        when(
          () => mockValidateCodeUseCase(any()),
        ).thenAnswer((_) async => const Right('token'));
        await cubit.validateCode(email: 'test@example.com', code: '123456');
      },
      expect: () => [
        const ResetPasswordState(isLoading: true),
        const ResetPasswordState(
          isLoading: false,
          status: ResetPasswordStatus.setPassword,
          resetToken: 'token',
        ),
      ],
    );

    blocTest<ResetPasswordCubit, ResetPasswordState>(
      'emits [loading, error] when validateCode fails',
      build: () => ResetPasswordCubit(
        mockRequestCodeUseCase,
        mockValidateCodeUseCase,
        mockResetPasswordUseCase,
      ),
      act: (cubit) async {
        when(
          () => mockValidateCodeUseCase(any()),
        ).thenAnswer((_) async => Left(ServerFailure(message: 'Error')));
        await cubit.validateCode(email: 'test@example.com', code: '123456');
      },
      expect: () => [
        const ResetPasswordState(isLoading: true),
        ResetPasswordState(isLoading: false, error: 'errors.serverError'.tr()),
      ],
    );

    blocTest<ResetPasswordCubit, ResetPasswordState>(
      'emits [loading, success] when setPassword succeeds',
      build: () => ResetPasswordCubit(
        mockRequestCodeUseCase,
        mockValidateCodeUseCase,
        mockResetPasswordUseCase,
      ),
      act: (cubit) async {
        when(
          () => mockResetPasswordUseCase(any()),
        ).thenAnswer((_) async => const Right(true));
        // Set up state to have a resetToken
        cubit.emit(
          const ResetPasswordState(
            status: ResetPasswordStatus.setPassword,
            resetToken: 'token',
          ),
        );
        await cubit.setPassword('newPassword');
      },
      expect: () => [
        const ResetPasswordState(
          status: ResetPasswordStatus.setPassword,
          resetToken: 'token',
        ),
        const ResetPasswordState(
          status: ResetPasswordStatus.setPassword,
          resetToken: 'token',
          isLoading: true,
        ),
        const ResetPasswordState(
          isLoading: false,
          status: ResetPasswordStatus.success,
          resetToken: null,
        ),
      ],
    );

    blocTest<ResetPasswordCubit, ResetPasswordState>(
      'emits [loading, error] when setPassword fails',
      build: () => ResetPasswordCubit(
        mockRequestCodeUseCase,
        mockValidateCodeUseCase,
        mockResetPasswordUseCase,
      ),
      act: (cubit) async {
        when(
          () => mockResetPasswordUseCase(any()),
        ).thenAnswer((_) async => Left(ServerFailure(message: 'Error')));
        // Set up state to have a resetToken
        cubit.emit(
          const ResetPasswordState(
            status: ResetPasswordStatus.setPassword,
            resetToken: 'token',
          ),
        );
        await cubit.setPassword('newPassword');
      },
      expect: () => [
        const ResetPasswordState(
          status: ResetPasswordStatus.setPassword,
          resetToken: 'token',
        ),
        const ResetPasswordState(
          status: ResetPasswordStatus.setPassword,
          resetToken: 'token',
          isLoading: true,
        ),
        ResetPasswordState(
          status: ResetPasswordStatus.setPassword,
          resetToken: 'token',
          isLoading: false,
          error: 'errors.serverError'.tr(),
        ),
      ],
    );
  });
}

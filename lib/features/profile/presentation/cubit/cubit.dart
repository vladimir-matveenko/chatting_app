import 'package:chatting_app/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:chatting_app/features/profile/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../auth/domain/entity/user_entity.dart';
import '../../domain/usecases/change_password_usecase.dart';
import '../../domain/usecases/create_profile_usecase.dart';
import '../../domain/usecases/fetch_profile_usecase.dart';

@lazySingleton
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._fetchProfileUseCase,
    this._changePasswordUseCase,
    this._createProfileUseCase,
    this._updateProfileUseCase,
  ) : super(const ProfileState());
  final FetchProfileUseCase _fetchProfileUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final CreateProfileUseCase _createProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;

  Future<void> loadProfile() async {
    emit(state.copyWith(isLoading: true));
    final profile = await _fetchProfileUseCase(NoParams());
    profile.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(profile: r, isLoading: false));
      },
    );
  }

  Future<void> createProfile({
    required String username,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createProfileUseCase(
      CreateProfileParams(username: username, email: email, password: password),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(isLoading: false, success: true));
      },
    );
  }

  Future<void> updateProfile({required UserEntity profile}) async {
    emit(state.copyWith(isLoading: true));
    final result = await _updateProfileUseCase(
      UpdateProfileParams(profile: profile),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(profile: profile, isLoading: false, success: true));
      },
    );
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(state.copyWith(isLoading: true));
    final result = await _changePasswordUseCase(
      ChangePasswordParams(
        currentPassword: currentPassword,
        newPassword: newPassword,
      ),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(isLoading: false, success: true));
      },
    );
  }

  Future<void> disableError() async {
    emit(state.copyWith(error: ''));
  }

  Future<void> disableSuccess() async {
    emit(state.copyWith(success: false));
  }
}

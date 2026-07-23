import 'package:chatting_app/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:chatting_app/features/profile/presentation/profile_cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/create_profile_usecase.dart';
import '../../domain/usecases/fetch_profile_usecase.dart';

@lazySingleton
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._fetchProfileUseCase,
    this._createProfileUseCase,
    this._updateProfileUseCase,
  ) : super(const ProfileState());
  final FetchProfileUseCase _fetchProfileUseCase;
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
    required String userName,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createProfileUseCase(
      CreateProfileParams(userName: userName, email: email, password: password),
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
        emit(state.copyWith(isLoading: false, createdSuccessful: true));
      },
    );
  }

  Future<void> updateProfile({
    String? username,
    String? displayName,
    String? email,
    String? avatarUrl,
  }) async {
    emit(state.copyWith(isLoading: true));
    final result = await _updateProfileUseCase(
      UpdateProfileParams(
        username: username,
        displayName: displayName,
        email: email,
        avatarUrl: avatarUrl,
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
        emit(state.copyWith(isLoading: false, updatedSuccessful: true));
      },
    );
  }

  Future<void> disableError() async {
    emit(state.copyWith(error: ''));
  }

  Future<void> disableSuccess() async {
    emit(state.copyWith(createdSuccessful: false, updatedSuccessful: false));
  }
}

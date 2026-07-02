import 'package:chatting_app/features/profile/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/usecases/delete_profile_usecase.dart';
import '../../domain/usecases/fetch_profile_usecase.dart';
import '../../domain/usecases/save_profile_usecase.dart';

@lazySingleton
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._fetchProfileUseCase,
    this._saveProfileUseCase,
    this._deleteProfileUseCase,
  ) : super(const ProfileState());
  final FetchProfileUseCase _fetchProfileUseCase;
  final SaveProfileUseCase _saveProfileUseCase;
  final DeleteProfileUseCase _deleteProfileUseCase;

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
    required String firstName,
    required String lastName,
    int wordCount = 10,
  }) async {
    emit(state.copyWith(isLoading: true));
    final profile = ProfileEntity(
      firstName: firstName,
      lastName: lastName,
      wordCount: wordCount,
    );
    await _saveProfileUseCase(ProfileParams(profile: profile));
    emit(state.copyWith(profile: profile, isLoading: false, success: true));
  }

  Future<void> updateProfile({required ProfileEntity profile}) async {
    emit(state.copyWith(isLoading: true));
    final result = await _saveProfileUseCase(ProfileParams(profile: profile));
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

  Future<void> deleteProfile() async {
    await _deleteProfileUseCase(NoParams());
    emit(
      state.copyWith(
        profile: const ProfileEntity(
          firstName: '',
          lastName: '',
          wordCount: 10,
        ),
      ),
    );
  }

  Future<void> disableError() async {
    emit(state.copyWith(error: ''));
  }

  Future<void> disableSuccess() async {
    emit(state.copyWith(success: false));
  }
}

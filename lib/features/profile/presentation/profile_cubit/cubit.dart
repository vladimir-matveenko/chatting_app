import 'package:chatting_app/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:chatting_app/features/profile/presentation/profile_cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/utils/app_utils.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/services/image_service.dart';
import '../../domain/usecases/create_profile_usecase.dart';
import '../../domain/usecases/delete_avatar_usecase.dart';
import '../../domain/usecases/fetch_profile_usecase.dart';
import '../../domain/usecases/update_avatar_usecase.dart';

@lazySingleton
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._fetchProfileUseCase,
    this._createProfileUseCase,
    this._updateProfileUseCase,
    this._updateAvatarUseCase,
    this._deleteAvatarUseCase,
  ) : super(const ProfileState());
  final FetchProfileUseCase _fetchProfileUseCase;
  final CreateProfileUseCase _createProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final UpdateAvatarUseCase _updateAvatarUseCase;
  final DeleteAvatarUseCase _deleteAvatarUseCase;

  Future<void> loadProfile({bool loadSilent = true}) async {
    emit(state.copyWith(isLoading: !loadSilent));
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
  }) async {
    emit(state.copyWith(isLoading: true));
    final result = await _updateProfileUseCase(
      UpdateProfileParams(
        username: username,
        displayName: displayName,
        email: email,
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

  Future<void> updateUserAvatar() async {
    if (state.isAvatarLoading) return;
    emit(state.copyWith(isAvatarLoading: true));
    final avatar = await ImageService.getImageFromGallery();

    if (avatar == null) {
      emit(state.copyWith(isAvatarLoading: false));
      return;
    }

    final result = await _updateAvatarUseCase(UpdateAvatarParams(avatar));
    result.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isAvatarLoading: false,
          ),
        );
      },
      (r) {
        emit(state.copyWith(isAvatarLoading: false, updatedSuccessful: true));
      },
    );
  }

  Future<void> deleteUserAvatar() async {
    final result = await _deleteAvatarUseCase(NoParams());
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
        emit(state.copyWith(updatedSuccessful: true));
      },
    );
  }

  Future<void> disableError() async {
    emit(state.copyWith(error: null));
  }

  Future<void> disableSuccess() async {
    emit(state.copyWith(createdSuccessful: false, updatedSuccessful: false));
  }
}

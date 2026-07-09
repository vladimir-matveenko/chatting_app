import 'package:chatting_app/features/profile/presentation/widgets/edit_profile_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/domain/entity/user_entity.dart';
import '../cubit/cubit.dart';
import '../widgets/profile_screen_wrapper.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late ProfileCubit cubit;
  late UserEntity profile;
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _emailNameController = TextEditingController();
  bool jobDone = false;

  void _onSave() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final updatedProfile = profile.copyWith(
      username: _userNameController.text.trim(),
    );

    if (updatedProfile == cubit.state.profile) {
      return;
    }

    cubit.updateProfile(profile: updatedProfile);
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<ProfileCubit>();
    profile =
        cubit.state.profile ??
        UserEntity(
          id: '',
          username: '',
          displayName: '',
          email: '',
          avatarUrl: '',
          createdAt: DateTime.now(),
        );
    _userNameController.text = profile.username;
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: ProfileScreenWrapper(
        successMessage: 'editProfileScreen.updated'.tr(),
        buildBody: (context, state) {
          final isLoading = state.isLoading;
          final isBlocked = jobDone;
          return EditProfileForm(
            isFormActive: !isLoading && !isBlocked,
            isLoading: isLoading,
            formKey: _formKey,
            userNameController: _userNameController,
            displayNameController: _displayNameController,
            emailController: _emailNameController,
            onSaveTapped: _onSave,
            mainButtonText: 'editProfileScreen.btnSave'.tr(),
          );
        },
        onJobDone: () {
          jobDone = true;
        },
        onSuccess: () {
          context.pop();
        },
      ),
    );
  }
}

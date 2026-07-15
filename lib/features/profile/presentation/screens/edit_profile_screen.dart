import 'package:chatting_app/features/profile/presentation/widgets/edit_profile_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/domain/entity/user_entity.dart';
import '../profile_cubit/cubit.dart';
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
  final _emailController = TextEditingController();
  bool jobDone = false;

  void _onSave() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    cubit.updateProfile(
      username: profile.userName == _userNameController.text.trim()
          ? ''
          : _userNameController.text.trim(),
      displayName: profile.displayName == _displayNameController.text.trim()
          ? ''
          : _displayNameController.text.trim(),
      email: profile.email == _emailController.text.trim()
          ? ''
          : _emailController.text.trim(),
    );
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<ProfileCubit>();
    profile =
        cubit.state.profile ??
        UserEntity(
          id: '',
          userName: '',
          displayName: '',
          email: '',
          avatarUrl: '',
          createdAt: DateTime.now(),
        );
    _userNameController.text = profile.userName;
    _displayNameController.text = profile.displayName;
    _emailController.text = profile.email;
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _displayNameController.dispose();
    _emailController.dispose();
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
            emailController: _emailController,
            onSaveTapped: _onSave,
            mainButtonText: 'editProfileScreen.btnSave'.tr(),
          );
        },
        onJobDone: () {
          jobDone = true;
        },
        onSuccess: () {
          context.read<ProfileCubit>().loadProfile();
          context.pop();
        },
      ),
    );
  }
}

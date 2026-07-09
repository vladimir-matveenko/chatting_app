import 'package:chatting_app/features/profile/presentation/widgets/edit_profile_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entity/profile_entity.dart';
import '../cubit/cubit.dart';
import '../widgets/profile_screen_wrapper.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late ProfileCubit cubit;
  late ProfileEntity profile;
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  bool jobDone = false;

  void _onSave() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final updatedProfile = profile.copyWith(
      firstName: _userNameController.text.trim(),
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
    profile = cubit.state.profile ?? ProfileEntity(firstName: '', lastName: '');
    _userNameController.text = profile.firstName;
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

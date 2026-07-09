import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/app_back_button.dart';
import '../../../auth/presentation/cubit/cubit.dart';
import '../cubit/cubit.dart';
import '../widgets/create_profile_form.dart';
import '../widgets/profile_screen_wrapper.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final obscure = ValueNotifier<bool>(true);
  bool jobDone = false;

  void _handleCreateProfile() {
    if (_formKey.currentState!.validate()) {
      context.read<ProfileCubit>().createProfile(
        username: _userNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('createProfileScreen.screenName'.tr()),
        centerTitle: true,
        leading: const AppBackButton(),
      ),
      resizeToAvoidBottomInset: true,
      body: ProfileScreenWrapper(
        successMessage: 'profileScreen.created'.tr(),
        buildBody: (context, state) {
          final isLoading = state.isLoading;
          final isBlocked = jobDone;
          return CreateProfileForm(
            isFormActive: !isLoading && !isBlocked,
            isLoading: isLoading,
            formKey: _formKey,
            userNameController: _userNameController,
            emailController: _emailController,
            passwordController: _passwordController,
            onSaveTapped: _handleCreateProfile,
            mainButtonText: 'createProfileScreen.btnCreate'.tr(),
            obscure: obscure,
            onObscureChanged: (value) {
              obscure.value = value;
            },
          );
        },
        onJobDone: () {
          jobDone = true;
        },
        onSuccess: () {
          context.read<AuthCubit>().checkAuth();
        },
      ),
    );
  }
}

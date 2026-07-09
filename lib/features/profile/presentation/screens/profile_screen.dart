import 'package:chatting_app/features/login/presentation/cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/presentation/widgets/app_dialog.dart';
import '../../../../core/presentation/widgets/app_loader.dart';
import '../../../auth/presentation/cubit/cubit.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../widgets/language_selector.dart';
import '../widgets/theme_selector.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileCubit cubit;
  late AuthCubit authCubit;
  late LoginCubit loginCubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ProfileCubit>();
    cubit.loadProfile();
    authCubit = context.read<AuthCubit>();
    loginCubit = context.read<LoginCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return ColoredBox(
          color: theme.scaffoldBackgroundColor,
          child: state.isLoading
              ? const AppLoader()
              : Column(
                  mainAxisAlignment: .center,
                  spacing: 16.0,
                  children: [
                    Text(
                      state.profile?.username ?? '',
                      style: theme.textTheme.headlineSmall,
                    ),
                    Text(
                      state.profile?.email ?? '',
                      style: theme.textTheme.headlineSmall,
                    ),
                    const ThemeSelector(),
                    const LanguageSelector(),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                      ),
                      onPressed: () {
                        context.go(
                          '${AppRoutes.profile}/${AppRoutes.editProfile}',
                        );
                      },
                      child: Row(
                        spacing: 4.0,
                        mainAxisSize: .min,
                        children: [
                          Text('editProfileScreen.screenName'.tr()),
                          Icon(
                            Icons.edit,
                            color: theme.colorScheme.primary,
                            size: 16.0,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                        textStyle: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          decoration: .underline,
                          decorationColor: theme.colorScheme.primary,
                        ),
                      ),
                      onPressed: () {
                        context.push(AppRoutes.licenses);
                      },
                      child: const Text('Open Source Licenses'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        authCubit.logout();
                        loginCubit.onLogout();
                      },
                      child: Text('profileScreen.logout'.tr()),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.error,
                      ),
                      onPressed: () async {
                        final result = await AppDialog.show(
                          context,
                          title: 'profileScreen.btnRemove'.tr(),
                          text: 'profileScreen.youWantRemove'.tr(),
                          cancelText: 'cancelText'.tr(),
                          okText: 'okText'.tr(),
                        );
                        if (result) {
                          authCubit.logout();
                          loginCubit.onLogout();
                        }
                      },
                      child: Text('profileScreen.btnRemoveProfile'.tr()),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

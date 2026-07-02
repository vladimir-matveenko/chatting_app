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

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileCubit cubit;
  late AuthCubit authCubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ProfileCubit>();
    cubit.loadProfile();
    authCubit = context.read<AuthCubit>();
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
                      state.profile?.firstName ?? '',
                      style: theme.textTheme.headlineSmall,
                    ),
                    Text(
                      state.profile?.lastName ?? '',
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
                          Text('editProfilePage.screenName'.tr()),
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
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.error,
                      ),
                      onPressed: () async {
                        final result = await AppDialog.show(
                          context,
                          title: 'profilePage.btnRemove'.tr(),
                          text: 'profilePage.youWantRemove'.tr(),
                          cancelText: 'cancelText'.tr(),
                          okText: 'okText'.tr(),
                        );
                        if (result) {
                          cubit.deleteProfile();
                          authCubit.logout();
                        }
                      },
                      child: Text('profilePage.btnRemoveProfile'.tr()),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

import 'package:chatting_app/features/profile/presentation/profile_cubit/cubit.dart';
import 'package:chatting_app/features/profile/presentation/profile_cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/app_loader.dart';

class LicensesScreen extends StatelessWidget {
  const LicensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const AppLoader();
        }

        final info = state.appInfo;

        return LicensePage(
          applicationName: info?.appName ?? '',
          applicationVersion:
              '${info?.version ?? ''} (${info?.buildNumber ?? ''})',
        );
      },
    );
  }
}

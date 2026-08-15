import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/app_message.dart';
import '../profile_cubit/cubit.dart';
import '../profile_cubit/state.dart';

class ProfileScreenWrapper extends StatelessWidget {
  const ProfileScreenWrapper({
    super.key,
    required this.successMessage,
    required this.buildBody,
    required this.onJobDone,
    required this.onSuccess,
  });

  final String successMessage;
  final Widget Function(BuildContext, ProfileState) buildBody;
  final VoidCallback onJobDone;
  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: buildBody,
      listener: (context, state) {
        if (state.error?.isNotEmpty == true) {
          AppMessage.error(
            context,
            message: state.error!,
            onClose: () {
              context.read<ProfileCubit>().disableError();
            },
          );
        }
        if (state.createdSuccessful || state.updatedSuccessful) {
          onJobDone.call();
          if (successMessage.isNotEmpty) {
            AppMessage.success(
              context,
              message: successMessage,
              onClose: () {
                context.read<ProfileCubit>().disableSuccess();
                onSuccess.call();
              },
            );
          } else {
            context.read<ProfileCubit>().disableSuccess();
            onSuccess.call();
          }
        }
      },
    );
  }
}

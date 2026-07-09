import 'package:chatting_app/features/profile/presentation/change_password_cubit/cubit.dart';
import 'package:chatting_app/features/profile/presentation/change_password_cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/app_message.dart';

class ChangePasswordScreenWrapper extends StatelessWidget {
  const ChangePasswordScreenWrapper({
    super.key,
    required this.successMessage,
    required this.buildBody,
    required this.onJobDone,
    required this.onSuccess,
  });

  final String successMessage;
  final Widget Function(BuildContext, ChangePasswordState) buildBody;
  final VoidCallback onJobDone;
  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      builder: buildBody,
      listener: (context, state) {
        if (state.error?.isNotEmpty == true) {
          AppMessage.error(
            context,
            message: state.error!,
            onClose: () {
              context.read<ChangePasswordCubit>().disableError();
            },
          );
        }
        if (state.changedSuccessful) {
          onJobDone.call();
          AppMessage.success(
            context,
            message: successMessage,
            onClose: () {
              context.read<ChangePasswordCubit>().disableSuccess();
              onSuccess.call();
            },
          );
        }
      },
    );
  }
}

import 'package:chatting_app/core/presentation/widgets/text_fields/app_text_form_field.dart';
import 'package:chatting_app/features/reset_password/presentation/cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/app_loader.dart';
import '../../../../core/presentation/widgets/countdown_timer.dart';

class RequestCodeBody extends StatefulWidget {
  const RequestCodeBody({super.key});

  @override
  State<RequestCodeBody> createState() => _RequestCodeBodyState();
}

class _RequestCodeBodyState extends State<RequestCodeBody> {
  late ResetPasswordCubit cubit;
  final _formKey = GlobalKey<FormState>();

  void _onRequestTapped() {
    if (!(_formKey.currentState?.validate() ?? false) ||
        !cubit.requestCodeTimerController.isFinished) {
      return;
    }
    cubit.requestCode();
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<ResetPasswordCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ResetPasswordCubit>().state;
    final isLoading = state.isLoading;
    return Center(
      child: Padding(
        padding: const .symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: .min,
            mainAxisAlignment: .start,
            crossAxisAlignment: .stretch,
            spacing: 16.0,
            children: [
              if (!cubit.requestCodeTimerController.isFinished)
                CountdownTimer(
                  controller: cubit.requestCodeTimerController,
                  prefixWidget: Text(
                    '${'resetPasswordScreen.resendCode'.tr()}:',
                  ),
                  onFinishedPlaceholder: const SizedBox(),
                ),
              AppTextFormField(
                controller: cubit.emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'fieldValidation.enterEmail'.tr();
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _onRequestTapped,
                child: isLoading
                    ? AppLoader.small()
                    : Text('resetPasswordScreen.btnRequest'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:chatting_app/app/router/app_routes.dart';
import 'package:chatting_app/features/reset_password/presentation/cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const .all(16.0),
        child: Column(
          crossAxisAlignment: .stretch,
          mainAxisSize: .min,
          spacing: 24.0,
          children: [
            const Icon(Icons.check, color: Colors.green, size: 60.0),
            Text('resetPasswordScreen.successMessage'.tr(), textAlign: .center),
            ElevatedButton(
              onPressed: () {
                context.read<ResetPasswordCubit>().disableSuccess();
                context.go(AppRoutes.login);
              },
              child: Text('okText'.tr()),
            ),
          ],
        ),
      ),
    );
  }
}

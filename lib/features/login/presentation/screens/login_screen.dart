import 'package:chatting_app/core/presentation/widgets/text_fields/email_text_field.dart';
import 'package:chatting_app/core/presentation/widgets/text_fields/password_field.dart';
import 'package:chatting_app/features/auth/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/login/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/login/presentation/cubit/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/presentation/widgets/app_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final obscure = ValueNotifier<bool>(true);

  void handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  @override
  void initState() {
    context.read<LoginCubit>().setInitialParameters();
    _emailController.text = 'email@email.com';
    _passwordController.text = '1234567890';
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('loginScreen.screenName'.tr()),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          final isLoading = state.status == LoginStatus.inProgress;
          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsetsGeometry.only(
                top: 24.0,
                left: 24.0,
                right: 24.0,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 16.0,
                  children: [
                    Icon(
                      state.status == LoginStatus.success
                          ? Icons.lock_open_outlined
                          : Icons.lock_outline,
                      size: 80.0,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 40.0),
                    EmailTextField(
                      enabled: !isLoading,
                      emailController: _emailController,
                    ),
                    PasswordTextField(
                      enabled: !isLoading,
                      passwordController: _passwordController,
                      obscure: obscure,
                      onObscureChanged: (value) {
                        obscure.value = value;
                      },
                    ),
                    ElevatedButton(
                      onPressed: isLoading ? null : handleLogin,
                      child: isLoading
                          ? const SizedBox(
                              width: 20.0,
                              height: 20.0,
                              child: CircularProgressIndicator.adaptive(
                                strokeWidth: 2.0,
                              ),
                            )
                          : Text('loginScreen.btnLogin'.tr()),
                    ),
                    TextButton(
                      onPressed: () {
                        context.push(AppRoutes.createProfile);
                      },
                      child: Text('createProfileScreen.screenName'.tr()),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state.status == LoginStatus.failure &&
              state.error?.isNotEmpty == true) {
            AppMessage.error(
              context,
              message: state.error!,
              onClose: () {
                context.read<LoginCubit>().disableError();
              },
            );
          }
          if (state.status == LoginStatus.success) {
            context.read<AuthCubit>().checkAuth();
          }
        },
      ),
    );
  }
}

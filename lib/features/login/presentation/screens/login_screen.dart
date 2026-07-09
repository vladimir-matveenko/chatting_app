import 'package:chatting_app/features/auth/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/login/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/login/presentation/cubit/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/presentation/widgets/app_message.dart';
import '../../../../core/presentation/widgets/app_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var obscure = true;

  void handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  void obscureIcon() {
    setState(() {
      obscure = !obscure;
    });
  }

  @override
  void initState() {
    _emailController.text = 'email11@email.com';
    _passwordController.text = '123456789';
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
                    AppTextFormField(
                      controller: _emailController,
                      enabled: !isLoading,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'loginScreen.fieldNameEmail'.tr(),
                        prefix: const Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'fieldValidation.enterPassword'.tr();
                        }
                        return null;
                      },
                    ),
                    AppTextFormField(
                      controller: _passwordController,
                      enabled: !isLoading,
                      obscureText: obscure,
                      maxLines: 1,
                      decoration: InputDecoration(
                        labelText: 'loginScreen.fieldNamePassword'.tr(),
                        prefix: GestureDetector(
                          onTap: obscureIcon,
                          child: Icon(obscure ? Icons.lock : Icons.lock_open),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'fieldValidation.enterPassword'.tr();
                        }
                        return null;
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
                        context.go(AppRoutes.createProfile);
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
            AppMessage.error(context, message: state.error!);
          }
          if (state.status == LoginStatus.success) {
            context.read<AuthCubit>().checkAuth();
          }
        },
      ),
    );
  }
}

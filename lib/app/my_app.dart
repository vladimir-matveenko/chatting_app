import 'package:chatting_app/app/router/app_router.dart';
import 'package:chatting_app/features/login/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/profile/presentation/change_password_cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/auth/presentation/cubit/cubit.dart';
import '../features/profile/presentation/profile_cubit/cubit.dart';
import '../features/theme/presentation/cubit/cubit.dart';
import '../features/theme/presentation/cubit/state.dart';
import 'di/injection.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = getIt<AppRouter>();
  final themeCubit = getIt<ThemeCubit>();
  final authCubit = getIt<AuthCubit>();
  final loginCubit = getIt<LoginCubit>();
  final profileCubit = getIt<ProfileCubit>();
  final changePasswordCubit = getIt<ChangePasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => authCubit),
        BlocProvider(create: (_) => loginCubit),
        BlocProvider(create: (_) => profileCubit),
        BlocProvider(create: (_) => changePasswordCubit),
        BlocProvider(create: (_) => themeCubit..loadTheme()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Chatting App',
            routerConfig: appRouter.router,
            debugShowCheckedModeBanner: false,
            theme: state.theme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        },
      ),
    );
  }
}

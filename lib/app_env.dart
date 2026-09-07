import 'package:flutter/material.dart';

import 'app/constants/app_constants.dart';

@immutable
class AppEnv {
  const AppEnv._();

  static String get baseUrl => const String.fromEnvironment(
    'BASE_URL',
    defaultValue: AppConstants.baseUrl,
  );
}

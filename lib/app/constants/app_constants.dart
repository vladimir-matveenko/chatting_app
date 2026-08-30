import 'package:flutter/material.dart';

@immutable
class AppConstants {
  const AppConstants._();

  static const String cachedTokenKey = 'CHATTING_APP_CACHED_TOKEN';
  static const String themeKey = 'theme_mode';

  /// test data
  static const String testEmail = 'john@example.com';
  static const String testPassword = '1234567890';

  /// locales
  static const String enLocale = 'en-US';
  static const String ruLocale = 'ru-Ru';

  /// reactions
  static const reactions = ['👍', '👎︎'];

  /// available image types
  static const availableImageTypes = ['jpeg', 'png', 'webp'];
}

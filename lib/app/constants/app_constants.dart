import 'package:flutter/material.dart';

@immutable
class AppConstants {
  const AppConstants._();

  static const themeKey = 'theme_mode';

  /// test data
  static const testEmail = 'john@example.com';
  static const testPassword = '1234567890';

  /// locales
  static const enLocale = 'en-US';
  static const ruLocale = 'ru-Ru';

  /// reactions
  static const reactions = ['👍', '👎︎'];

  /// available image types
  static const availableImageTypes = ['jpeg', 'png', 'webp'];
}

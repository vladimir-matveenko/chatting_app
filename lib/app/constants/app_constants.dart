import 'package:flutter/material.dart';

@immutable
class AppConstants {
  const AppConstants._();

  static const assetDbName = 'en_ru_dictionary.db';
  static const profileKey = 'profile';
  static const themeKey = 'theme_mode';
  static const paginationLimitMessages = 10;

  /// locales
  static const enLocale = 'en-US';
  static const ruLocale = 'ru-Ru';

  /// reactions
  static const reactions = ['👍', '👎︎'];

  /// available image types
  static const availableImageTypes = ['jpeg', 'png', 'webp'];
}

import 'package:flutter/material.dart';

@immutable
class AssetPaths {
  const AssetPaths._();

  static const assetTranslationsPath = 'assets/translations';
  static const splashLogo = 'assets/images/splash_logo.png';
  static const splashBackground = 'assets/images/splash_background.png';
  static const congratsAnimation = 'assets/images/congrats_animation.gif';

  /// flags
  static const flagRu = 'assets/flags/flag_ru.svg';
  static const flagUs = 'assets/flags/flag_us.svg';

  /// errors
  static const somethingWentWrong = 'assets/images/something_went_wrong.png';
  static const noConnectionServer = 'assets/images/no_connection_server.png';

  /// emoji
  static const like = 'assets/emoji/like.svg';
  static const dislike = 'assets/emoji/dislike.svg';
}

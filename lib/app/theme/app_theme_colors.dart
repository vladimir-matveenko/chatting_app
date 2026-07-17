import 'package:flutter/material.dart';

import '../../features/theme/domain/entity/app_theme_mode.dart';

class AppThemeColors {
  const AppThemeColors({
    required this.primary,
    required this.onPrimary,
    required this.error,
    required this.onError,
    required this.success,
    required this.scaffoldBackground,
    required this.unselectedWidget,
    required this.canvas,
    required this.splash,
    required this.surfaceTint,
    required this.bottomBarBackground,
    required this.fieldBorder,
    required this.fieldBorderFocussed,
    required this.fieldBorderDisabled,
    required this.primaryText,
    required this.secondaryText,
    required this.cardBackground,
  });

  final Color primary;
  final Color onPrimary;
  final Color error;
  final Color onError;
  final Color success;
  final Color scaffoldBackground;
  final Color unselectedWidget;
  final Color canvas;
  final Color splash;
  final Color surfaceTint;
  final Color bottomBarBackground;
  final Color fieldBorder;
  final Color fieldBorderFocussed;
  final Color fieldBorderDisabled;
  final Color primaryText;
  final Color secondaryText;
  final Color cardBackground;

  static AppThemeColors fromMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return light;
      case AppThemeMode.dark:
        return dark;
    }
  }

  static final light = const AppThemeColors(
    primary: Color(0xFF2E7D32),
    onPrimary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    success: Colors.green,
    scaffoldBackground: Color(0xFFE8F5E9),
    unselectedWidget: Color(0xFF94A3B8),
    canvas: Color(0xFFE8F5E9),
    splash: Color(0xFFE8F5E9),
    surfaceTint: Colors.transparent,
    bottomBarBackground: Color(0xFFD2E3D4),
    fieldBorder: Colors.grey,
    fieldBorderFocussed: Color(0xFF2E7D32),
    fieldBorderDisabled: Color(0xFF94A3B8),
    primaryText: Color(0xFF0F2416),
    secondaryText: Color(0xFF64748B),
    cardBackground: Color(0xFFE2E8F0),
  );

  static final dark = const AppThemeColors(
    primary: Color(0xFF38BDF8),
    onPrimary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    success: Colors.green,
    scaffoldBackground: Color(0xFF1B2A41),
    unselectedWidget: Color(0xFF94A3B8),
    canvas: Color(0xFF1B2A41),
    splash: Color(0xFF1B2A41),
    surfaceTint: Colors.transparent,
    bottomBarBackground: Color(0xFF25354E),
    fieldBorder: Colors.grey,
    fieldBorderFocussed: Color(0xFF38BDF8),
    fieldBorderDisabled: Color(0xFF94A3B8),
    primaryText: Colors.white,
    secondaryText: Color(0xFF94A3B8),
    cardBackground: Color(0xFF25354E),
  );
}

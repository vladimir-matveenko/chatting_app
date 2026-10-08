import 'package:chatting_app/app/theme/app_theme_colors.dart';
import 'package:flutter/material.dart';

class AppMessage {
  static void show(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    VoidCallback? onClose,
  }) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(content: Text(message), backgroundColor: backgroundColor),
        )
        .closed
        .then((_) {
          if (onClose != null) {
            onClose.call();
          }
        });
  }

  static void error(
    BuildContext context, {
    required String message,
    VoidCallback? onClose,
  }) {
    AppMessage.show(
      context,
      message: message,
      backgroundColor: Theme.of(context).colorScheme.error,
      onClose: onClose,
    );
  }

  static void success(
    BuildContext context, {
    required String message,
    VoidCallback? onClose,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark
        ? AppThemeColors.dark.success
        : AppThemeColors.light.success;
    AppMessage.show(
      context,
      message: message,
      backgroundColor: color,
      onClose: onClose,
    );
  }
}

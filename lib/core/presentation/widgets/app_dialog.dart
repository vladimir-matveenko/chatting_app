import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDialog {
  static Future<bool> show(
    BuildContext context, {
    required String title,
    required String text,
    required String cancelText,
    required String okText,
  }) async {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final width = min(MediaQuery.sizeOf(context).width, 300.0);
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: const .all(16.0),
          constraints: BoxConstraints(maxWidth: width),
          child: Column(
            mainAxisSize: .min,
            spacing: 16.0,
            children: [
              Text(title, style: textTheme.titleMedium),
              Text(text, style: textTheme.bodyMedium),
              Row(
                mainAxisAlignment: .spaceBetween,
                spacing: 16.0,
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.grey),
                      onPressed: () => context.pop(false),
                      child: Text(
                        cancelText,
                        style: textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: theme.colorScheme.error,
                      ),
                      onPressed: () => context.pop(true),
                      child: Text(
                        okText,
                        style: textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return result ?? false;
  }

  static Future empty(
    BuildContext context, {
    required Widget content,
    VoidCallback? onClose,
  }) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(child: content),
    ).then((_) {
      onClose?.call();
    });
  }
}

import 'package:flutter/material.dart';

extension StringX on String {
  String normalize() => trim().toLowerCase();
}

extension DateX on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

extension ThemeDataX on ThemeData {
  bool isDark() => brightness == Brightness.dark;

  bool isLight() => brightness == Brightness.light;
}

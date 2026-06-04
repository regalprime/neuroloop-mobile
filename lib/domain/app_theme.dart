import 'package:flutter/material.dart';

import 'app_theme_id.dart';
import 'extension/app_theme_extension.dart';

class AppTheme {
  const AppTheme({
    required this.id,
    required this.themeData,
    required this.extension,
  });

  final AppThemeId id;
  final ThemeData themeData;
  final AppThemeExtension extension;

  String get displayName => id.displayName;

  bool get isDark => id.isDark;
}

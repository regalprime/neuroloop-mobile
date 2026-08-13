import 'package:flutter/material.dart';

import '../tokens/app_theme_extension.dart';
import '../tokens/color_tokens.dart';
import '../tokens/motion_tokens.dart';
import '../tokens/spacing_tokens.dart';
import 'app_theme.dart';
import 'light_theme.dart' show LightTypographyTokens;

class DarkColorTokens extends ColorTokens {
  const DarkColorTokens();

  @override
  Color get surfacePrimary => const Color(0xFF1C1C1E);
  @override
  Color get surfaceSecondary => const Color(0xFF2C2C2E);
  @override
  Color get surfaceTertiary => const Color(0xFF3A3A3C);
  @override
  Color get surfaceInverse => const Color(0xFFFFFFFF);

  @override
  Color get contentPrimary => const Color(0xFFF2F2F7);
  @override
  Color get contentSecondary => const Color(0xFFAEAEB2);
  @override
  Color get contentTertiary => const Color(0xFF8E8E93);
  @override
  Color get contentDisabled => const Color(0xFF636366);
  @override
  Color get contentInverse => const Color(0xFF1C1C1E);

  @override
  Color get borderPrimary => const Color(0xFF48484A);
  @override
  Color get borderSecondary => const Color(0xFF3A3A3C);
  @override
  Color get borderFocus => const Color(0xFF0A84FF);

  @override
  Color get interactivePrimary => const Color(0xFF0A84FF);
  @override
  Color get interactivePrimaryHover => const Color(0xFF409CFF);
  @override
  Color get interactivePrimaryPressed => const Color(0xFF6BB2FF);
  @override
  Color get interactiveDisabled => const Color(0xFF48484A);

  @override
  Color get statusSuccess => const Color(0xFF32D74B);
  @override
  Color get statusWarning => const Color(0xFFFF9F0A);
  @override
  Color get statusError => const Color(0xFFFF453A);
  @override
  Color get statusInfo => const Color(0xFF0A84FF);
}

class DarkAppTheme extends AppTheme {
  const DarkAppTheme();

  static const _colors = DarkColorTokens();
  static const _typography = LightTypographyTokens(); // type scale is shared
  static const _spacing = AppSpacingTokens();
  static const _motion = AppMotionTokens();

  @override
  String get id => 'dark';

  @override
  String get label => 'Dark';

  @override
  Brightness get brightness => Brightness.dark;

  @override
  AppThemeExtension get tokens => const AppThemeExtension(
        colors: _colors,
        typography: _typography,
        spacing: _spacing,
        motion: _motion,
      );

  @override
  ThemeData get themeData {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _colors.interactivePrimary,
      brightness: Brightness.dark,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _colors.surfacePrimary,
      extensions: [tokens],
    );
  }
}
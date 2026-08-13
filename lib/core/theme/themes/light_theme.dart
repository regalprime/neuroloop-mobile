import 'package:flutter/material.dart';

import '../tokens/app_theme_extension.dart';
import '../tokens/color_tokens.dart';
import '../tokens/motion_tokens.dart';
import '../tokens/spacing_tokens.dart';
import '../tokens/typography_tokens.dart';
import 'app_theme.dart';

class LightColorTokens extends ColorTokens {
  const LightColorTokens();

  @override
  Color get surfacePrimary => const Color(0xFFFFFFFF);
  @override
  Color get surfaceSecondary => const Color(0xFFF5F5F7);
  @override
  Color get surfaceTertiary => const Color(0xFFEBEBEF);
  @override
  Color get surfaceInverse => const Color(0xFF1C1C1E);

  @override
  Color get contentPrimary => const Color(0xFF1C1C1E);
  @override
  Color get contentSecondary => const Color(0xFF6E6E73);
  @override
  Color get contentTertiary => const Color(0xFF9A9A9E);
  @override
  Color get contentDisabled => const Color(0xFFC7C7CC);
  @override
  Color get contentInverse => const Color(0xFFFFFFFF);

  @override
  Color get borderPrimary => const Color(0xFFD1D1D6);
  @override
  Color get borderSecondary => const Color(0xFFE5E5EA);
  @override
  Color get borderFocus => const Color(0xFF0A84FF);

  @override
  Color get interactivePrimary => const Color(0xFF0A66FF);
  @override
  Color get interactivePrimaryHover => const Color(0xFF0052D4);
  @override
  Color get interactivePrimaryPressed => const Color(0xFF003D9E);
  @override
  Color get interactiveDisabled => const Color(0xFFC7C7CC);

  @override
  Color get statusSuccess => const Color(0xFF1F9254);
  @override
  Color get statusWarning => const Color(0xFFB25E0A);
  @override
  Color get statusError => const Color(0xFFD62D2D);
  @override
  Color get statusInfo => const Color(0xFF0A66FF);
}

class LightTypographyTokens extends TypographyTokens {
  const LightTypographyTokens();

  static const _family = 'Inter'; // swap for your app's brand font

  @override
  TextStyle get displayLarge => const TextStyle(
      fontFamily: _family, fontSize: 57, fontWeight: FontWeight.w400, height: 1.12);
  @override
  TextStyle get displayMedium => const TextStyle(
      fontFamily: _family, fontSize: 45, fontWeight: FontWeight.w400, height: 1.16);

  @override
  TextStyle get headlineLarge => const TextStyle(
      fontFamily: _family, fontSize: 32, fontWeight: FontWeight.w600, height: 1.25);
  @override
  TextStyle get headlineMedium => const TextStyle(
      fontFamily: _family, fontSize: 28, fontWeight: FontWeight.w600, height: 1.29);
  @override
  TextStyle get headlineSmall => const TextStyle(
      fontFamily: _family, fontSize: 24, fontWeight: FontWeight.w600, height: 1.33);

  @override
  TextStyle get titleLarge => const TextStyle(
      fontFamily: _family, fontSize: 22, fontWeight: FontWeight.w600, height: 1.27);
  @override
  TextStyle get titleMedium => const TextStyle(
      fontFamily: _family, fontSize: 16, fontWeight: FontWeight.w600, height: 1.5);
  @override
  TextStyle get titleSmall => const TextStyle(
      fontFamily: _family, fontSize: 14, fontWeight: FontWeight.w600, height: 1.43);

  @override
  TextStyle get bodyLarge => const TextStyle(
      fontFamily: _family, fontSize: 16, fontWeight: FontWeight.w400, height: 1.5);
  @override
  TextStyle get bodyMedium => const TextStyle(
      fontFamily: _family, fontSize: 14, fontWeight: FontWeight.w400, height: 1.43);
  @override
  TextStyle get bodySmall => const TextStyle(
      fontFamily: _family, fontSize: 12, fontWeight: FontWeight.w400, height: 1.33);

  @override
  TextStyle get labelLarge => const TextStyle(
      fontFamily: _family, fontSize: 14, fontWeight: FontWeight.w500, height: 1.43);
  @override
  TextStyle get labelMedium => const TextStyle(
      fontFamily: _family, fontSize: 12, fontWeight: FontWeight.w500, height: 1.33);
  @override
  TextStyle get labelSmall => const TextStyle(
      fontFamily: _family, fontSize: 11, fontWeight: FontWeight.w500, height: 1.45);
}

class LightAppTheme extends AppTheme {
  const LightAppTheme();

  static const _colors = LightColorTokens();
  static const _typography = LightTypographyTokens();
  static const _spacing = AppSpacingTokens();
  static const _motion = AppMotionTokens();

  @override
  String get id => 'light';

  @override
  String get label => 'Light';

  @override
  Brightness get brightness => Brightness.light;

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
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _colors.surfacePrimary,
      extensions: [tokens],
    );
  }
}
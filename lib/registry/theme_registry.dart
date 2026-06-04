import 'package:flutter/material.dart';

import '../builder/app_theme_builder.dart';
import '../domain/app_theme.dart';
import '../domain/app_theme_id.dart';
import '../themes/amoled_theme.dart';
import '../themes/brand/brand_a_theme.dart';
import '../themes/dark_theme.dart';
import '../themes/high_contrast_light_theme.dart';
import '../themes/light_theme.dart';
import '../themes/sepia_theme.dart';

class ThemeRegistry {
  ThemeRegistry._();

  static final ThemeRegistry instance = ThemeRegistry._();

  late final AppTheme _fallback = _buildFallback();



  late final Map<AppThemeId, AppTheme> _registry = _buildAll();

  AppTheme _buildFallback() {
    final spacing = const DefaultSpacingTokens();
    final motion = const DefaultMotionTokens();
    final typo = const DefaultTypographyTokens();

    return AppThemeBuilder.build(
      id: AppThemeId.lightDefault,
      colors: const LightColorTokens(),
      typography: typo,
      spacing: spacing,
      motion: motion,
    );
  }

  Map<AppThemeId, AppTheme> _buildAll() {
    final spacing = const DefaultSpacingTokens();
    final motion = const DefaultMotionTokens();
    final typo = const DefaultTypographyTokens();

    return {
      AppThemeId.lightDefault: AppThemeBuilder.build(
        id: AppThemeId.lightDefault,
        colors: const LightColorTokens(),
        typography: typo,
        spacing: spacing,
        motion: motion,
      ),
      AppThemeId.darkDefault: AppThemeBuilder.build(
        id: AppThemeId.darkDefault,
        colors: const DarkColorTokens(),
        typography: typo,
        spacing: spacing,
        motion: motion,
      ),
      AppThemeId.highContrastLight: AppThemeBuilder.build(
        id: AppThemeId.highContrastLight,
        colors: const HighContrastLightColorTokens(),
        typography: typo,
        spacing: const HighContrastSpacingTokens(),
        motion: motion,
      ),
      // AppThemeId.highContrastDark: AppThemeBuilder.build(
      //   id: AppThemeId.highContrastDark,
      //   colors: const HighContrastDarkColorTokens(),
      //   typography: typo,
      //   spacing: const HighContrastSpacingTokens(),
      //   motion: motion,
      // ),
      AppThemeId.amoled: AppThemeBuilder.build(
        id: AppThemeId.amoled,
        colors: const AmoledColorTokens(),
        typography: typo,
        spacing: spacing,
        motion: motion,
      ),
      AppThemeId.sepia: AppThemeBuilder.build(
        id: AppThemeId.sepia,
        colors: const SepiaColorTokens(),
        typography: typo,
        spacing: spacing,
        motion: motion,
      ),
      AppThemeId.brandA: AppThemeBuilder.build(
        id: AppThemeId.brandA,
        colors: const BrandAColorTokens(),
        typography: typo,
        spacing: spacing,
        motion: motion,
      ),
      AppThemeId.brandB: AppThemeBuilder.build(
        id: AppThemeId.brandB,
        colors: const BrandAColorTokens(),
        // placeholder
        typography: typo,
        spacing: spacing,
        motion: motion,
      ),
    };
  }

  AppTheme get(AppThemeId id) {
    return _registry[id] ?? _fallback;
  }

  AppTheme safeGet(AppThemeId? id) {
    if (id == null) return _fallback;
    return _registry[id] ?? _fallback;
  }

  AppTheme resolveForSystem(Brightness systemBrightness) =>
      get(systemBrightness == Brightness.dark ? AppThemeId.darkDefault : AppThemeId.lightDefault);

  List<AppTheme> get all => _registry.values.toList();
}

import 'package:flutter/material.dart';

import '../domain/tokens/color_tokens.dart';
import '../domain/tokens/motion_tokens.dart';
import '../domain/tokens/spacing_tokens.dart';
import '../domain/tokens/typography_tokens.dart';

class DefaultSpacingTokens implements SpacingTokens {
  const DefaultSpacingTokens();

  @override
  double get xs => 4;

  @override
  double get sm => 8;

  @override
  double get md => 16;

  @override
  double get lg => 24;

  @override
  double get xl => 32;

  @override
  double get xxl => 48;

  @override
  double get xxxl => 64;

  @override
  double get radiusXs => 2;

  @override
  double get radiusSm => 4;

  @override
  double get radiusMd => 8;

  @override
  double get radiusLg => 12;

  @override
  double get radiusXl => 16;

  @override
  double get radiusFull => 999;

  @override
  double get elevationNone => 0;

  @override
  double get elevationLow => 1;

  @override
  double get elevationMid => 3;

  @override
  double get elevationHigh => 6;

  @override
  double get elevationModal => 12;

  @override
  double get breakpointMobile => 600;

  @override
  double get breakpointTablet => 900;

  @override
  double get breakpointDesktop => 1200;
}

// ── Default motion ────────────────────────────────────────────
class DefaultMotionTokens implements MotionTokens {
  const DefaultMotionTokens();

  @override
  Duration get durationInstant => const Duration(milliseconds: 50);

  @override
  Duration get durationFast => const Duration(milliseconds: 150);

  @override
  Duration get durationNormal => const Duration(milliseconds: 250);

  @override
  Duration get durationSlow => const Duration(milliseconds: 400);

  @override
  Duration get durationVerySlow => const Duration(milliseconds: 600);

  @override
  Curve get curveStandard => Curves.easeInOut;

  @override
  Curve get curveDecelerate => Curves.easeOut;

  @override
  Curve get curveAccelerate => Curves.easeIn;

  @override
  Curve get curveSpring => Curves.elasticOut;
}

// ── Light color tokens ────────────────────────────────────────
class LightColorTokens implements ColorTokens {
  const LightColorTokens();

  @override
  Color get brandPrimary => const Color(0xFF1565C0);

  @override
  Color get brandPrimaryVariant => const Color(0xFF003C8F);

  @override
  Color get brandSecondary => const Color(0xFF00695C);

  @override
  Color get brandSecondaryVariant => const Color(0xFF003D33);

  @override
  Color get brandTertiary => const Color(0xFF4527A0);

  @override
  Color get onBrandPrimary => const Color(0xFFFFFFFF);

  @override
  Color get onBrandSecondary => const Color(0xFFFFFFFF);

  @override
  Color get onBrandTertiary => const Color(0xFFFFFFFF);

  @override
  Color get semanticSuccess => const Color(0xFF2E7D32);

  @override
  Color get semanticSuccessSubtle => const Color(0xFFE8F5E9);

  @override
  Color get semanticWarning => const Color(0xFFE65100);

  @override
  Color get semanticWarningSubtle => const Color(0xFFFFF3E0);

  @override
  Color get semanticError => const Color(0xFFC62828);

  @override
  Color get semanticErrorSubtle => const Color(0xFFFFEBEE);

  @override
  Color get semanticInfo => const Color(0xFF01579B);

  @override
  Color get semanticInfoSubtle => const Color(0xFFE1F5FE);

  @override
  Color get onSemanticSuccess => const Color(0xFFFFFFFF);

  @override
  Color get onSemanticWarning => const Color(0xFFFFFFFF);

  @override
  Color get onSemanticError => const Color(0xFFFFFFFF);

  @override
  Color get onSemanticInfo => const Color(0xFFFFFFFF);

  @override
  Color get surfaceBackground => const Color(0xFFF5F5F5);

  @override
  Color get surfaceCard => const Color(0xFFFFFFFF);

  @override
  Color get surfaceModal => const Color(0xFFFFFFFF);

  @override
  Color get surfaceInput => const Color(0xFFFAFAFA);

  @override
  Color get surfaceHover => const Color(0x0A000000); // 4%
  @override
  Color get surfacePressed => const Color(0x14000000); // 8%
  @override
  Color get surfaceDisabled => const Color(0xFFF5F5F5);

  @override
  Color get contentPrimary => const Color(0xFF212121);

  @override
  Color get contentSecondary => const Color(0xFF616161);

  @override
  Color get contentTertiary => const Color(0xFF9E9E9E);

  @override
  Color get contentDisabled => const Color(0xFFBDBDBD);

  @override
  Color get contentInverse => const Color(0xFFFFFFFF);

  @override
  Color get contentLink => const Color(0xFF1565C0);

  @override
  Color get contentLinkVisited => const Color(0xFF6A1B9A);

  @override
  Color get borderDefault => const Color(0xFFE0E0E0);

  @override
  Color get borderStrong => const Color(0xFF9E9E9E);

  @override
  Color get borderFocus => const Color(0xFF1565C0);

  @override
  Color get borderError => const Color(0xFFC62828);

  @override
  Color get interactivePrimary => const Color(0xFF1565C0);

  @override
  Color get interactivePrimaryHover => const Color(0xFF1976D2);

  @override
  Color get interactivePrimaryPressed => const Color(0xFF0D47A1);

  @override
  Color get interactivePrimaryDisabled => const Color(0xFFBDBDBD);

  @override
  Color get tagDefaultBackground => const Color(0xFFEEEEEE);

  @override
  Color get tagDefaultForeground => const Color(0xFF424242);

  @override
  Color get tagSuccessBackground => const Color(0xFFE8F5E9);

  @override
  Color get tagSuccessForeground => const Color(0xFF1B5E20);

  @override
  Color get tagWarningBackground => const Color(0xFFFFF3E0);

  @override
  Color get tagWarningForeground => const Color(0xFFE65100);

  @override
  Color get tagErrorBackground => const Color(0xFFFFEBEE);

  @override
  Color get tagErrorForeground => const Color(0xFFB71C1C);

  @override
  ColorScheme toColorScheme(Brightness brightness) => ColorScheme(
        brightness: brightness,
        primary: brandPrimary,
        onPrimary: onBrandPrimary,
        primaryContainer: const Color(0xFFD1E4FF),
        onPrimaryContainer: const Color(0xFF001D36),
        secondary: brandSecondary,
        onSecondary: onBrandSecondary,
        secondaryContainer: const Color(0xFFC8E8E0),
        onSecondaryContainer: const Color(0xFF002019),
        tertiary: brandTertiary,
        onTertiary: onBrandTertiary,
        tertiaryContainer: const Color(0xFFE6DEFF),
        onTertiaryContainer: const Color(0xFF1A0063),
        error: semanticError,
        onError: onSemanticError,
        errorContainer: semanticErrorSubtle,
        onErrorContainer: const Color(0xFF410002),
        surface: surfaceCard,
        onSurface: contentPrimary,
        surfaceContainerHighest: surfaceBackground,
        outline: borderDefault,
        outlineVariant: borderStrong,
      );
}

// ── Light typography ──────────────────────────────────────────
class DefaultTypographyTokens implements TypographyTokens {
  const DefaultTypographyTokens();

  @override
  String get fontFamilyPrimary => 'Inter';

  @override
  String get fontFamilyMono => 'JetBrains Mono';

  @override
  double get scaleBase => 1.0;

  @override
  double get lineHeightBase => 1.5;

  @override
  double get letterSpacingBase => 0.0;

  @override
  TextTheme buildTextTheme(Color primary, Color secondary) => TextTheme(
        displayLarge: _s(57, 0.4, -0.25, primary),
        displayMedium: _s(45, 0.4, 0, primary),
        displaySmall: _s(36, 0.4, 0, primary),
        headlineLarge: _s(32, 0.6, 0, primary),
        headlineMedium: _s(28, 0.6, 0, primary),
        headlineSmall: _s(24, 0.6, 0, primary),
        titleLarge: _s(22, 0.5, 0, primary),
        titleMedium: _s(16, 0.5, 0.15, primary),
        titleSmall: _s(14, 0.5, 0.1, primary),
        bodyLarge: _s(16, 0.4, 0.5, primary),
        bodyMedium: _s(14, 0.4, 0.25, primary),
        bodySmall: _s(12, 0.4, 0.4, secondary),
        labelLarge: _s(14, 0.5, 1.25, primary),
        labelMedium: _s(12, 0.5, 1.25, secondary),
        labelSmall: _s(11, 0.5, 1.5, secondary),
      );

  TextStyle _s(double size, double w, double ls, Color c) => TextStyle(
        fontSize: size,
        fontWeight: FontWeight.lerp(FontWeight.w100, FontWeight.w900, w),
        letterSpacing: ls,
        color: c,
        height: lineHeightBase,
      );
}

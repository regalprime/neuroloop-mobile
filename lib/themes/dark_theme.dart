import 'package:flutter/material.dart';

import '../domain/tokens/color_tokens.dart';

class DarkColorTokens implements ColorTokens {
  const DarkColorTokens();

  @override
  Color get brandPrimary => const Color(0xFF90CAF9);

  @override
  Color get brandPrimaryVariant => const Color(0xFFBBDEFB);

  @override
  Color get brandSecondary => const Color(0xFF80CBC4);

  @override
  Color get brandSecondaryVariant => const Color(0xFFB2DFDB);

  @override
  Color get brandTertiary => const Color(0xFFCE93D8);

  @override
  Color get onBrandPrimary => const Color(0xFF003C8F);

  @override
  Color get onBrandSecondary => const Color(0xFF003D33);

  @override
  Color get onBrandTertiary => const Color(0xFF38006B);

  @override
  Color get semanticSuccess => const Color(0xFF81C784);

  @override
  Color get semanticSuccessSubtle => const Color(0xFF1B3B1E);

  @override
  Color get semanticWarning => const Color(0xFFFFB74D);

  @override
  Color get semanticWarningSubtle => const Color(0xFF3E2400);

  @override
  Color get semanticError => const Color(0xFFEF9A9A);

  @override
  Color get semanticErrorSubtle => const Color(0xFF3B1010);

  @override
  Color get semanticInfo => const Color(0xFF81D4FA);

  @override
  Color get semanticInfoSubtle => const Color(0xFF012F4A);

  @override
  Color get onSemanticSuccess => const Color(0xFF003300);

  @override
  Color get onSemanticWarning => const Color(0xFF3E1F00);

  @override
  Color get onSemanticError => const Color(0xFF3B0000);

  @override
  Color get onSemanticInfo => const Color(0xFF001F2E);

  @override
  Color get surfaceBackground => const Color(0xFF0E0E0E);

  @override
  Color get surfaceCard => const Color(0xFF1A1A1A);

  @override
  Color get surfaceModal => const Color(0xFF242424);

  @override
  Color get surfaceInput => const Color(0xFF1F1F1F);

  @override
  Color get surfaceHover => const Color(0x0FFFFFFF);

  @override
  Color get surfacePressed => const Color(0x1AFFFFFF);

  @override
  Color get surfaceDisabled => const Color(0xFF1A1A1A);

  @override
  Color get contentPrimary => const Color(0xFFE0E0E0);

  @override
  Color get contentSecondary => const Color(0xFF9E9E9E);

  @override
  Color get contentTertiary => const Color(0xFF616161);

  @override
  Color get contentDisabled => const Color(0xFF424242);

  @override
  Color get contentInverse => const Color(0xFF121212);

  @override
  Color get contentLink => const Color(0xFF90CAF9);

  @override
  Color get contentLinkVisited => const Color(0xFFCE93D8);

  @override
  Color get borderDefault => const Color(0xFF2C2C2C);

  @override
  Color get borderStrong => const Color(0xFF424242);

  @override
  Color get borderFocus => const Color(0xFF90CAF9);

  @override
  Color get borderError => const Color(0xFFEF9A9A);

  @override
  Color get interactivePrimary => const Color(0xFF90CAF9);

  @override
  Color get interactivePrimaryHover => const Color(0xFFBBDEFB);

  @override
  Color get interactivePrimaryPressed => const Color(0xFF64B5F6);

  @override
  Color get interactivePrimaryDisabled => const Color(0xFF424242);

  @override
  Color get tagDefaultBackground => const Color(0xFF2C2C2C);

  @override
  Color get tagDefaultForeground => const Color(0xFFBDBDBD);

  @override
  Color get tagSuccessBackground => const Color(0xFF1B3B1E);

  @override
  Color get tagSuccessForeground => const Color(0xFF81C784);

  @override
  Color get tagWarningBackground => const Color(0xFF3E2400);

  @override
  Color get tagWarningForeground => const Color(0xFFFFB74D);

  @override
  Color get tagErrorBackground => const Color(0xFF3B1010);

  @override
  Color get tagErrorForeground => const Color(0xFFEF9A9A);

  @override
  ColorScheme toColorScheme(Brightness brightness) => ColorScheme(
        brightness: brightness,
        primary: brandPrimary,
        onPrimary: onBrandPrimary,
        primaryContainer: const Color(0xFF003C8F),
        onPrimaryContainer: const Color(0xFFD1E4FF),
        secondary: brandSecondary,
        onSecondary: onBrandSecondary,
        secondaryContainer: const Color(0xFF003D33),
        onSecondaryContainer: const Color(0xFFC8E8E0),
        tertiary: brandTertiary,
        onTertiary: onBrandTertiary,
        tertiaryContainer: const Color(0xFF38006B),
        onTertiaryContainer: const Color(0xFFE6DEFF),
        error: semanticError,
        onError: onSemanticError,
        errorContainer: semanticErrorSubtle,
        onErrorContainer: const Color(0xFFFFDAD6),
        surface: surfaceCard,
        onSurface: contentPrimary,
        surfaceContainerHighest: surfaceBackground,
        outline: borderDefault,
        outlineVariant: borderStrong,
      );
}

import 'package:flutter/material.dart';

abstract class ColorTokens {
  // ── Brand ────────────────────────────────────────────────
  Color get brandPrimary;

  Color get brandPrimaryVariant;

  Color get brandSecondary;

  Color get brandSecondaryVariant;

  Color get brandTertiary;

  // ── On-brand ─────────────────────────────────────────────
  Color get onBrandPrimary;

  Color get onBrandSecondary;

  Color get onBrandTertiary;

  // ── Semantic ─────────────────────────────────────────────
  Color get semanticSuccess;

  Color get semanticSuccessSubtle;

  Color get semanticWarning;

  Color get semanticWarningSubtle;

  Color get semanticError;

  Color get semanticErrorSubtle;

  Color get semanticInfo;

  Color get semanticInfoSubtle;

  Color get onSemanticSuccess;

  Color get onSemanticWarning;

  Color get onSemanticError;

  Color get onSemanticInfo;

  // ── Surface ───────────────────────────────────────────────
  Color get surfaceBackground;

  Color get surfaceCard;

  Color get surfaceModal;

  Color get surfaceInput;

  Color get surfaceHover;

  Color get surfacePressed;

  Color get surfaceDisabled;

  // ── Content ───────────────────────────────────────────────
  Color get contentPrimary;

  Color get contentSecondary;

  Color get contentTertiary;

  Color get contentDisabled;

  Color get contentInverse;

  Color get contentLink;

  Color get contentLinkVisited;

  // ── Border ───────────────────────────────────────────────
  Color get borderDefault;

  Color get borderStrong;

  Color get borderFocus;

  Color get borderError;

  // ── Interactive ───────────────────────────────────────────
  Color get interactivePrimary;

  Color get interactivePrimaryHover;

  Color get interactivePrimaryPressed;

  Color get interactivePrimaryDisabled;

  // ── Tag / Badge ───────────────────────────────────────────
  Color get tagDefaultBackground;

  Color get tagDefaultForeground;

  Color get tagSuccessBackground;

  Color get tagSuccessForeground;

  Color get tagWarningBackground;

  Color get tagWarningForeground;

  Color get tagErrorBackground;

  Color get tagErrorForeground;

  ColorScheme toColorScheme(Brightness brightness);
}

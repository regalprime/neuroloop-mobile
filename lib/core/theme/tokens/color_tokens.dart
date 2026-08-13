import 'package:flutter/material.dart';

/// Semantic color contract. Concrete themes implement this to supply
/// role-based colors instead of exposing raw Material values — UI code
/// should reference these semantic roles (`contentPrimary`,
/// `surfaceSecondary`, ...), never `Colors.xxx` directly. This is the
/// same principle behind mature design systems (Material 3 color roles,
/// IBM Carbon, Atlassian ADS): naming *what a color means*, not what it
/// looks like, so swapping a theme or adding a brand variant never
/// requires touching feature code.
@immutable
abstract class ColorTokens {
  const ColorTokens();

  // Surfaces
  Color get surfacePrimary;
  Color get surfaceSecondary;
  Color get surfaceTertiary;
  Color get surfaceInverse;

  // Content (text / icons)
  Color get contentPrimary;
  Color get contentSecondary;
  Color get contentTertiary;
  Color get contentDisabled;
  Color get contentInverse;

  // Borders / dividers
  Color get borderPrimary;
  Color get borderSecondary;
  Color get borderFocus;

  // Interactive (buttons, links)
  Color get interactivePrimary;
  Color get interactivePrimaryHover;
  Color get interactivePrimaryPressed;
  Color get interactiveDisabled;

  // Feedback / status
  Color get statusSuccess;
  Color get statusWarning;
  Color get statusError;
  Color get statusInfo;
}
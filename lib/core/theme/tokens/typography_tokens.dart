import 'package:flutter/material.dart';

/// Semantic type-scale contract, aligned to the Material 3 type-scale
/// naming so it stays familiar to any Flutter engineer joining the team,
/// and so `Theme.of(context).textTheme` and these tokens never drift
/// into two competing vocabularies for the same concept.
@immutable
abstract class TypographyTokens {
  const TypographyTokens();

  TextStyle get displayLarge;
  TextStyle get displayMedium;

  TextStyle get headlineLarge;
  TextStyle get headlineMedium;
  TextStyle get headlineSmall;

  TextStyle get titleLarge;
  TextStyle get titleMedium;
  TextStyle get titleSmall;

  TextStyle get bodyLarge;
  TextStyle get bodyMedium;
  TextStyle get bodySmall;

  TextStyle get labelLarge;
  TextStyle get labelMedium;
  TextStyle get labelSmall;
}
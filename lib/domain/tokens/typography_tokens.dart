import 'package:flutter/material.dart';

abstract class TypographyTokens {
  String get fontFamilyPrimary;

  String get fontFamilyMono;

  double get scaleBase;

  double get lineHeightBase;

  double get letterSpacingBase;

  TextTheme buildTextTheme(Color contentPrimary, Color contentSecondary);
}

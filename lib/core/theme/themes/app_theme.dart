import 'package:flutter/material.dart';

import '../tokens/app_theme_extension.dart';

/// Contract every concrete theme (light, dark, high-contrast, brand
/// variants, ...) must satisfy. [ThemeRegistry] catalogs implementations
/// of this class; the picker UI and [ThemeBloc] only ever depend on this
/// interface, never on a specific theme — that's what lets you add an
/// 8th brand theme without touching the bloc, the picker, or the
/// repository.
@immutable
abstract class AppTheme {
  const AppTheme();

  /// Stable identifier persisted to disk. Never change this once
  /// shipped — a saved user preference for an id that no longer exists
  /// would silently fall back to the default theme.
  String get id;

  /// Human-readable name shown in the theme picker.
  String get label;

  Brightness get brightness;

  AppThemeExtension get tokens;

  ThemeData get themeData;
}
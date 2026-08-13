import 'package:flutter/material.dart';

import 'color_tokens.dart';
import 'motion_tokens.dart';
import 'spacing_tokens.dart';
import 'typography_tokens.dart';

/// Bundles all four token contracts into a single [ThemeExtension] so
/// the whole design-token set travels with [ThemeData] and is reachable
/// via `Theme.of(context).extension<AppThemeExtension>()` — no separate
/// InheritedWidget, Provider, or global singleton needed for tokens.
/// This is the officially supported Flutter mechanism for app-specific
/// design tokens (`ThemeData.extensions`).
@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.colors,
    required this.typography,
    required this.spacing,
    required this.motion,
  });

  final ColorTokens colors;
  final TypographyTokens typography;
  final SpacingTokens spacing;
  final MotionTokens motion;

  @override
  AppThemeExtension copyWith({
    ColorTokens? colors,
    TypographyTokens? typography,
    SpacingTokens? spacing,
    MotionTokens? motion,
  }) {
    return AppThemeExtension(
      colors: colors ?? this.colors,
      typography: typography ?? this.typography,
      spacing: spacing ?? this.spacing,
      motion: motion ?? this.motion,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    // Token sets switch discretely between themes — colors aren't
    // meaningfully interpolated between two arbitrary brand palettes —
    // so flip at the midpoint rather than blending, purely so an
    // implicit theme-change animation (AnimatedTheme) doesn't render a
    // muddy mix of both palettes mid-transition.
    if (other is! AppThemeExtension) return this;
    return t < 0.5 ? this : other;
  }
}

/// Convenience accessor: `context.tokens.colors.contentPrimary`.
extension AppThemeExtensionX on BuildContext {
  AppThemeExtension get tokens =>
      Theme.of(this).extension<AppThemeExtension>()!;
}
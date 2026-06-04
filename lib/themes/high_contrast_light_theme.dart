import 'package:flutter/material.dart';

import 'light_theme.dart';

class HighContrastLightColorTokens extends LightColorTokens {
  const HighContrastLightColorTokens();

  @override
  Color get brandPrimary => const Color(0xFF000080);

  @override
  Color get contentPrimary => const Color(0xFF000000);

  @override
  Color get contentSecondary => const Color(0xFF1A1A1A);

  @override
  Color get borderDefault => const Color(0xFF000000);

  @override
  Color get borderStrong => const Color(0xFF000000);

  @override
  Color get semanticError => const Color(0xFF8B0000);

  @override
  Color get semanticSuccess => const Color(0xFF006400);
}

class HighContrastSpacingTokens extends DefaultSpacingTokens {
  const HighContrastSpacingTokens();

  @override
  double get sm => 10; // 8 → 10
  @override
  double get md => 20; // 16 → 20
  @override
  double get radiusMd => 4;
}

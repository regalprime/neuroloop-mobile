import 'package:flutter/material.dart';

import 'light_theme.dart';

class SepiaColorTokens extends LightColorTokens {
  const SepiaColorTokens();

  @override
  Color get surfaceBackground => const Color(0xFFF4ECD8);

  @override
  Color get surfaceCard => const Color(0xFFFAF0DC);

  @override
  Color get surfaceInput => const Color(0xFFF0E6CE);

  @override
  Color get contentPrimary => const Color(0xFF2C1A0E);

  @override
  Color get contentSecondary => const Color(0xFF5C3D2E);

  @override
  Color get contentTertiary => const Color(0xFF8B6A4E);

  @override
  Color get brandPrimary => const Color(0xFF7B4F2E);

  @override
  Color get borderDefault => const Color(0xFFD4B896);

  @override
  Color get contentLink => const Color(0xFF7B4F2E);
}

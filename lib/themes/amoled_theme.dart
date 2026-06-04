import 'package:flutter/material.dart';

import 'dark_theme.dart';

class AmoledColorTokens extends DarkColorTokens {
  const AmoledColorTokens();

  @override
  Color get surfaceBackground => const Color(0xFF000000);

  @override
  Color get surfaceCard => const Color(0xFF0A0A0A);

  @override
  Color get surfaceModal => const Color(0xFF111111);

  @override
  Color get surfaceInput => const Color(0xFF080808);

  @override
  Color get borderDefault => const Color(0xFF1A1A1A);
}

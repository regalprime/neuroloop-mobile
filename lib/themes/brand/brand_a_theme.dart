import 'package:flutter/material.dart';

import '../light_theme.dart';

class BrandAColorTokens extends LightColorTokens {
  const BrandAColorTokens();

  @override
  Color get brandPrimary => const Color(0xFF003087); // Cobalt
  @override
  Color get brandPrimaryVariant => const Color(0xFF001A4D);

  @override
  Color get brandSecondary => const Color(0xFF00A3E0); // Cyan
  @override
  Color get brandSecondaryVariant => const Color(0xFF006B99);

  @override
  Color get brandTertiary => const Color(0xFF00C389); // Mint
  @override
  Color get onBrandPrimary => const Color(0xFFFFFFFF);

  @override
  Color get onBrandSecondary => const Color(0xFF000000);

  @override
  Color get onBrandTertiary => const Color(0xFF000000);

  @override
  Color get contentLink => const Color(0xFF003087);

  @override
  Color get borderFocus => const Color(0xFF003087);

  @override
  Color get interactivePrimary => const Color(0xFF003087);
}

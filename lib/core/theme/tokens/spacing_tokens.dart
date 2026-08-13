import 'package:flutter/material.dart';

/// A fixed spacing scale stops magic numbers (`SizedBox(height: 13)`)
/// from spreading through the codebase and keeps every screen visually
/// consistent. Unlike color/typography, spacing is structural rather
/// than a matter of style, so in practice every theme shares the same
/// [AppSpacingTokens] instance — the abstract contract still exists so a
/// theme *could* override it (e.g. a compact/dense mode) without any
/// other layer changing.
@immutable
abstract class SpacingTokens {
  const SpacingTokens();

  double get xs;
  double get sm;
  double get md;
  double get lg;
  double get xl;
  double get xxl;
}

class AppSpacingTokens extends SpacingTokens {
  const AppSpacingTokens();

  @override
  double get xs => 4;
  @override
  double get sm => 8;
  @override
  double get md => 16;
  @override
  double get lg => 24;
  @override
  double get xl => 32;
  @override
  double get xxl => 48;
}
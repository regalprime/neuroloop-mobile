import 'package:flutter/material.dart';

/// Shared animation vocabulary so a "fast" transition means the same
/// 150ms everywhere in the app, instead of every screen picking its own
/// duration by feel.
@immutable
abstract class MotionTokens {
  const MotionTokens();

  Duration get fast; // micro-interactions: ripples, toggles
  Duration get medium; // standard transitions: page elements, sheets
  Duration get slow; // large or complex transitions

  Curve get easeIn;
  Curve get easeOut;
  Curve get easeInOut;
}

class AppMotionTokens extends MotionTokens {
  const AppMotionTokens();

  @override
  Duration get fast => const Duration(milliseconds: 150);
  @override
  Duration get medium => const Duration(milliseconds: 300);
  @override
  Duration get slow => const Duration(milliseconds: 500);

  @override
  Curve get easeIn => Curves.easeIn;
  @override
  Curve get easeOut => Curves.easeOut;
  @override
  Curve get easeInOut => Curves.easeInOut;
}
import 'package:flutter/material.dart';

abstract class MotionTokens {
  Duration get durationInstant; // 50ms
  Duration get durationFast; // 150ms
  Duration get durationNormal; // 250ms
  Duration get durationSlow; // 400ms
  Duration get durationVerySlow; // 600ms

  Curve get curveStandard; // easeInOut
  Curve get curveDecelerate; // easeOut — enter
  Curve get curveAccelerate; // easeIn  — exit
  Curve get curveSpring; // elastic
}

import 'package:flutter/material.dart';
import 'package:neuroloop/app/app.dart';
import 'package:neuroloop/app/flavor.dart';

void main() {
  const flavor = Flavor.prod;
  runApp(const NeuroLoopApp(flavor: flavor));
}


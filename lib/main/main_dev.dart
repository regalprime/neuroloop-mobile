import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/flavor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = Flavor.dev;

  runApp(NeuroLoopApp(flavor: flavor));
}

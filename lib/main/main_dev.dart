import 'package:flutter/material.dart';

import '../data/theme_repository_impl.dart';
import 'app/app.dart';
import 'app/flavor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = Flavor.dev;
  final themeRepository = ThemeRepositoryImpl();

  runApp(NeuroLoopApp(flavor: flavor, themeRepository: themeRepository));
}

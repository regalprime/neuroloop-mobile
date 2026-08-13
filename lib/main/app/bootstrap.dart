import 'package:flutter/material.dart';
import 'package:neuroloop/core/di/injection.dart';
import 'package:neuroloop/main/app/app.dart';
import 'package:neuroloop/main/app/flavor.dart';

Future<void> bootstrap({required Flavor flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await configureDependencies();

  runApp(NeuroLoopApp(
    flavor: flavor,
  ));
}

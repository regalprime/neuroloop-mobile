import 'package:flutter/material.dart';

import '../core/di/injection.dart';
import 'app/app.dart';
import 'app/flavor.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = Flavor.prod;

  await configureDependencies();

  runApp(NeuroLoopApp(
    flavor: flavor,
  ));
}

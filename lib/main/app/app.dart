import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:neuroloop/core/router/app_router.dart';

import 'flavor.dart';

class NeuroLoopApp extends StatelessWidget {
  final Flavor flavor;

  const NeuroLoopApp({
    super.key,
    required this.flavor,
  });

  @override
  Widget build(BuildContext context) {
    return _AppView();
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner:false,
      themeAnimationDuration: const Duration(milliseconds: 300),
      themeAnimationCurve: Curves.easeInOut,
      routerConfig: AppRouter.config,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

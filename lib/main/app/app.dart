import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:neuroloop/core/router/app_router.dart';
import 'package:neuroloop/core/theme/theme_bloc.dart';
import 'package:neuroloop/main/app/app_scope.dart';

import 'flavor.dart';

class NeuroLoopApp extends StatelessWidget {
  final Flavor flavor;

  const NeuroLoopApp({
    super.key,
    required this.flavor,
  });

  @override
  Widget build(BuildContext context) {
    return AppScope(
      child: _AppView(
        flavor: flavor,
      ),
    );
  }
}

class _AppView extends StatelessWidget {
  final Flavor flavor;

  const _AppView({required this.flavor});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: state.theme.themeData,
          themeAnimationDuration: const Duration(
            milliseconds: 300,
          ),
          themeAnimationCurve: Curves.easeInOut,
          routerConfig: AppRouter.config,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:neuroloop/core/router/app_router.dart';

import '../../bloc/theme/theme_bloc.dart';
import '../../data/theme_repository.dart';
import '../../domain/app_theme_id.dart';
import '../../registry/theme_registry.dart';
import 'flavor.dart';

class NeuroLoopApp extends StatelessWidget {
  final Flavor flavor;

  final ThemeRepository themeRepository;

  const NeuroLoopApp({super.key, required this.flavor, required this.themeRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(repository: themeRepository)..add(ThemeStarted()),
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      buildWhen: (p, c) =>
          p.flutterThemeMode != c.flutterThemeMode || p.lightTheme != c.lightTheme || p.darkTheme != c.darkTheme,
      builder: (context, state) {
        final registry = ThemeRegistry.instance;

        final light = state.lightTheme ?? registry.get(AppThemeId.lightDefault).themeData;

        final dark = state.darkTheme ?? registry.get(AppThemeId.darkDefault).themeData;

        if (!state.isLoaded) {
          return MaterialApp(
              home: Scaffold(
                  body: Center(
            child: CircularProgressIndicator(
              color: ThemeRegistry.instance.get(AppThemeId.lightDefault).themeData.colorScheme.primary,
            ),
          )));
        }
        return MaterialApp.router(
          theme: light,
          darkTheme: dark,
          themeMode: state.flutterThemeMode,
          themeAnimationDuration: const Duration(milliseconds: 300),
          themeAnimationCurve: Curves.easeInOut,
          routerConfig: AppRouter.config,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}

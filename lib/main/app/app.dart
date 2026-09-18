import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroloop/core/localization/bloc/language_bloc.dart';
import 'package:neuroloop/core/router/app_router.dart';
import 'package:neuroloop/core/theme/bloc/theme_bloc.dart';
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
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AppScope(
          child: _AppView(
            flavor: flavor,
          ),
        );
      },
    );
  }
}

class _AppView extends StatelessWidget {
  final Flavor flavor;

  const _AppView({
    required this.flavor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, languageState) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: themeState.theme.themeData,
              locale: languageState.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              themeAnimationDuration: const Duration(milliseconds: 300),
              themeAnimationCurve: Curves.easeInOut,
              routerConfig: AppRouter.config,
            );
          },
        );
      },
    );
  }
}

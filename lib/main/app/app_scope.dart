import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/core/di/injection.dart';
import 'package:neuroloop/core/localization/bloc/language_bloc.dart';
import 'package:neuroloop/core/theme/bloc/theme_bloc.dart';

class AppScope extends StatelessWidget {
  final Widget child;

  const AppScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ThemeBloc>(),
        ),
        BlocProvider<LanguageBloc>(
          create: (_) => getIt<LanguageBloc>()..add(LanguageInitialized()),
        ),
      ],
      child: child,
    );
  }
}

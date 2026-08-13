import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/core/di/injection.dart';
import 'package:neuroloop/core/theme/theme_bloc.dart';

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
      ],
      child: child,
    );
  }
}

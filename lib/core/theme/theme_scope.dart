import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/core/theme/theme_bloc.dart';

class ThemeScope extends StatelessWidget {
  final Widget child;

  const ThemeScope({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return child;
      },
    );
  }
}
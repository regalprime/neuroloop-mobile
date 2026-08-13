import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/core/theme/theme_bloc.dart';
import 'package:neuroloop/core/theme/theme_registry.dart';

class ThemePickerScreen extends StatelessWidget {
  const ThemePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return ListView(
            children: [
              for (final theme in ThemeRegistry.all)
                RadioListTile<String>(
                  title: Text(theme.label),
                  value: theme.id,
                  groupValue: state.theme.id,
                  onChanged: (id) {
                    if (id == null) return;
                    context.read<ThemeBloc>().add(ThemeChanged(themeId: id));
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}

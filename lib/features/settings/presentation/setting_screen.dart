import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/core/localization/supported_languages.dart';
import 'package:neuroloop/core/theme/bloc/theme_bloc.dart';
import 'package:neuroloop/core/theme/theme_registry.dart';

import '../../../core/localization/bloc/language_bloc.dart' show LanguageBloc, LanguageState, LanguageChanged;

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return Column(
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
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              return Column(
                children: [
                  for (final language in AppLanguage.values)
                    RadioListTile<AppLanguage>(
                      title: Text(
                        switch (language) {
                          AppLanguage.vietnamese => 'Tiếng Việt',
                          AppLanguage.english => 'English',
                        },
                      ),
                      value: language,
                      groupValue: state.language,
                      onChanged: (language) {
                        if (language == null) {
                          return;
                        }

                        context.read<LanguageBloc>().add(LanguageChanged(language: language));
                      },
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/core/localization/bloc/language_bloc.dart';
import 'package:neuroloop/core/localization/supported_languages.dart';

class LanguagePickerScreen extends StatelessWidget {
  const LanguagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return ListView(
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

                    context.read<LanguageBloc>().add(
                          LanguageChanged(
                            language: language,
                          ),
                        );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
  adsfasdf
}

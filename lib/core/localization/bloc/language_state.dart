part of 'language_bloc.dart';

class LanguageState {
  final AppLanguage language;

  const LanguageState({
    required this.language,
  });

  Locale get locale => language.locale;
}

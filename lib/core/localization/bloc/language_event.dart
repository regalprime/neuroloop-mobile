part of 'language_bloc.dart';

sealed class LanguageEvent {}

final class LanguageChanged extends LanguageEvent {
  final AppLanguage language;

  LanguageChanged({
    required this.language,
  });
}

final class LanguageInitialized extends LanguageEvent {}

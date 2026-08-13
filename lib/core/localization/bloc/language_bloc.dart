import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/core/localization/language_repository.dart';
import 'package:neuroloop/core/localization/supported_languages.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc({
    required LanguageRepository repository,
  })  : _repository = repository,
        super(
          const LanguageState(
            language: AppLanguage.english,
          ),
        ) {
    on<LanguageInitialized>(_onLanguageInitialized);
    on<LanguageChanged>(_onLanguageChanged);
  }

  final LanguageRepository _repository;

  Future<void> _onLanguageInitialized(
    LanguageInitialized event,
    Emitter<LanguageState> emit,
  ) async {
    final savedLanguage = await _repository.getSavedLanguage();

    if (savedLanguage == null) {
      return;
    }

    emit(
      LanguageState(
        language: savedLanguage,
      ),
    );
  }

  Future<void> _onLanguageChanged(
    LanguageChanged event,
    Emitter<LanguageState> emit,
  ) async {
    emit(
      LanguageState(
        language: event.language,
      ),
    );

    await _repository.saveLanguage(
      event.language,
    );
  }
}

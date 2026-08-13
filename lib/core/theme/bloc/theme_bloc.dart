import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme_registry.dart';
import '../theme_repository.dart';
import '../themes/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({required this.repository}) : super(ThemeState(theme: ThemeRegistry.defaultTheme)) {
    on<ThemeStarted>(_onThemeStarted);
    on<ThemeChanged>(_onThemeChanged);
  }

  final ThemeRepository repository;

  Future<void> _onThemeStarted(
    ThemeStarted event,
    Emitter<ThemeState> emit,
  ) async {
    final savedId = await repository.getSavedThemeId();
    if (savedId == null) return; // no saved preference — keep the default
    emit(ThemeState(theme: ThemeRegistry.byId(savedId)));
  }

  Future<void> _onThemeChanged(
    ThemeChanged event,
    Emitter<ThemeState> emit,
  ) async {
    final theme = ThemeRegistry.byId(event.themeId);
    // Emit first so the UI updates instantly; persist after, since a
    // failed write shouldn't block the user from seeing their choice.
    emit(ThemeState(theme: theme));
    await repository.saveThemeId(theme.id);
  }
}

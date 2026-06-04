import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/theme_repository.dart';
import '../../domain/app_theme.dart';
import '../../domain/app_theme_id.dart';
import '../../registry/theme_registry.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({
    required ThemeRepository repository,
    ThemeRegistry? registry,
  })  : _repository = repository,
        _registry = registry ?? ThemeRegistry.instance,
        super(const ThemeState()) {
    on<ThemeStarted>(_onStarted);
    on<ThemeSelected>(_onSelected);
    on<ThemeSystemToggled>(_onSystemToggled);
    on<ThemeReset>(_onReset);
  }

  final ThemeRepository _repository;
  final ThemeRegistry _registry;

  Future<void> _onStarted(ThemeStarted e, Emitter<ThemeState> emit) async {
    emit(state.copyWith(status: ThemeStatus.loading));
    try {
      final savedId = await _repository.getSelectedThemeId();
      final followSystem = await _repository.getFollowSystem();

      final resolved = savedId != null ? _registry.get(savedId) : _registry.get(AppThemeId.lightDefault);

      emit(_buildLoaded(
        selectedId: savedId ?? AppThemeId.lightDefault,
        followSystem: followSystem,
        current: resolved,
      ));
    } catch (_) {
      emit(state.copyWith(status: ThemeStatus.error));
    }
  }

  Future<void> _onSelected(ThemeSelected e, Emitter<ThemeState> emit) async {
    final theme = _registry.get(e.id);
    await _repository.saveSelectedThemeId(e.id);
    await _repository.saveFollowSystem(false);

    emit(_buildLoaded(
      selectedId: e.id,
      followSystem: false,
      current: theme,
    ));
  }

  Future<void> _onSystemToggled(ThemeSystemToggled e, Emitter<ThemeState> emit) async {
    final follow = !state.followSystem;
    await _repository.saveFollowSystem(follow);

    emit(state.copyWith(
      followSystem: follow,
      status: ThemeStatus.loaded,
    ));
  }

  Future<void> _onReset(ThemeReset e, Emitter<ThemeState> emit) async {
    await _repository.clearAll();
    final defaultTheme = _registry.get(AppThemeId.lightDefault);

    emit(_buildLoaded(
      selectedId: AppThemeId.lightDefault,
      followSystem: true,
      current: defaultTheme,
    ));
  }

  ThemeState _buildLoaded({
    required AppThemeId selectedId,
    required bool followSystem,
    required AppTheme current,
  }) =>
      ThemeState(
        status: ThemeStatus.loaded,
        selectedId: selectedId,
        followSystem: followSystem,
        currentTheme: current,
        lightTheme: _registry.get(AppThemeId.lightDefault).themeData,
        darkTheme: _registry.get(AppThemeId.darkDefault).themeData,
      );
}

part of 'theme_bloc.dart';

sealed class ThemeEvent {}

final class ThemeStarted extends ThemeEvent {}

final class ThemeSelected extends ThemeEvent {
  ThemeSelected(this.id);

  final AppThemeId id;
}

final class ThemeSystemToggled extends ThemeEvent {}

final class ThemeReset extends ThemeEvent {}

part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

/// Dispatched once at app startup to restore the previously saved theme.
final class ThemeStarted extends ThemeEvent {
  const ThemeStarted();
}

final class ThemeChanged extends ThemeEvent {
  const ThemeChanged({required this.themeId});

  final String themeId;

  @override
  List<Object?> get props => [themeId];
}
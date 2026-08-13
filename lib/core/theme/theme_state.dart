part of 'theme_bloc.dart';

final class ThemeState extends Equatable {
  const ThemeState({required this.theme});

  final AppTheme theme;

  @override
  List<Object?> get props => [theme.id];
}
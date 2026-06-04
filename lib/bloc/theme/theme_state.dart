part of 'theme_bloc.dart';

enum ThemeStatus { initial, loading, loaded, error }

final class ThemeState extends Equatable {
  const ThemeState({
    this.status = ThemeStatus.initial,
    this.selectedId,
    this.followSystem = true,
    this.lightTheme,
    this.darkTheme,
    this.currentTheme,
  });

  final ThemeStatus status;
  final AppThemeId? selectedId;
  final bool followSystem;

  final ThemeData? lightTheme;
  final ThemeData? darkTheme;

  final AppTheme? currentTheme;

  ThemeMode get flutterThemeMode {
    if (followSystem) return ThemeMode.system;
    return (selectedId?.isDark ?? false) ? ThemeMode.dark : ThemeMode.light;
  }

  bool get isLoaded => status == ThemeStatus.loaded;

  ThemeState copyWith({
    ThemeStatus? status,
    AppThemeId? selectedId,
    bool? followSystem,
    ThemeData? lightTheme,
    ThemeData? darkTheme,
    AppTheme? currentTheme,
  }) =>
      ThemeState(
        status: status ?? this.status,
        selectedId: selectedId ?? this.selectedId,
        followSystem: followSystem ?? this.followSystem,
        lightTheme: lightTheme ?? this.lightTheme,
        darkTheme: darkTheme ?? this.darkTheme,
        currentTheme: currentTheme ?? this.currentTheme,
      );

  @override
  List<Object?> get props => [
        status,
        selectedId,
        followSystem,
        lightTheme,
        darkTheme,
      ];
}

import 'themes/app_theme.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';

/// Central catalog of every theme the app ships. Adding a 3rd, 4th, ...
/// 8th theme (high-contrast, a white-label brand variant, ...) means
/// writing one [AppTheme] implementation and adding it to [all] —
/// nothing in [ThemeBloc], the repository, or the picker UI changes.
class ThemeRegistry {
  ThemeRegistry._();

  static const List<AppTheme> all = [
    LightAppTheme(),
    DarkAppTheme(),
    // Add more AppTheme implementations here.
  ];

  static AppTheme byId(String id) {
    return all.firstWhere(
      (theme) => theme.id == id,
      orElse: () => defaultTheme,
    );
  }

  static AppTheme get defaultTheme => all.first;
}
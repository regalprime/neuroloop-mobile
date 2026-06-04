import '../domain/app_theme_id.dart';

abstract interface class ThemeRepository {
  Future<AppThemeId?> getSelectedThemeId();

  Future<void> saveSelectedThemeId(AppThemeId id);

  Future<bool> getFollowSystem();

  Future<void> saveFollowSystem(bool follow);

  Future<void> clearAll();
}

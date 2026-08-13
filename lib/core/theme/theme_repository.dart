import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ThemeRepository {
  Future<String?> getSavedThemeId();

  Future<void> saveThemeId(String themeId);
}

class SharedPreferencesThemeRepository implements ThemeRepository {
  SharedPreferencesThemeRepository(
    this._preferences,
  );

  final SharedPreferences _preferences;

  static const String _themeIdKey = 'app_theme_id';

  @override
  Future<String?> getSavedThemeId() async {
    return _preferences.getString(_themeIdKey);
  }

  @override
  Future<void> saveThemeId(String themeId) async {
    await _preferences.setString(
      _themeIdKey,
      themeId,
    );
  }
}

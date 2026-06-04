import 'package:neuroloop/data/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/app_theme_id.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  static const _keyThemeId = 'theme_selected_id';
  static const _keyFollowSystem = 'theme_follow_system';

  @override
  Future<AppThemeId?> getSelectedThemeId() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_keyThemeId);
    if (name == null) return null;
    return AppThemeId.values.firstOrNull;
  }

  @override
  Future<void> saveSelectedThemeId(AppThemeId id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyThemeId, id.name);
  }

  @override
  Future<bool> getFollowSystem() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyFollowSystem) ?? true;
  }

  @override
  Future<void> saveFollowSystem(bool follow) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyFollowSystem, follow);
  }

  @override
  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyThemeId);
    await prefs.remove(_keyFollowSystem);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

import 'supported_languages.dart';

abstract interface class LanguageRepository {
  Future<AppLanguage?> getSavedLanguage();

  Future<void> saveLanguage(AppLanguage language);
}

class SharedPreferencesLanguageRepository implements LanguageRepository {
  SharedPreferencesLanguageRepository(
    this._preferences,
  );

  final SharedPreferences _preferences;

  static const _languageKey = 'app_language';

  @override
  Future<AppLanguage?> getSavedLanguage() async {
    final code = _preferences.getString(_languageKey);

    if (code == null) {
      return null;
    }

    for (final language in AppLanguage.values) {
      if (language.code == code) {
        return language;
      }
    }

    return null;
  }

  @override
  Future<void> saveLanguage(AppLanguage language) async {
    await _preferences.setString(
      _languageKey,
      language.code,
    );
  }
}

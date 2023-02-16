import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:core/core.dart';

abstract class PreferencesDataSource {
  factory PreferencesDataSource() => PreferencesDataSourceImpl();
  Future<ThemeType?> getThemeType();
  void saveThemeType(ThemeType themeType);
  Future<Locale?> getLocale();
  void saveLocale(Locale locale);
}

class PreferencesDataSourceImpl implements PreferencesDataSource {
  static const _locale = 'locale';
  static const _themeType = 'themeType';

  Future<SharedPreferences> get _prefs async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<ThemeType?> getThemeType() async {
    return _prefs
        .then((prefs) => prefs.getInt(_themeType))
        .then((value) => value != null ? ThemeType.values[value] : null);
  }

  @override
  void saveThemeType(ThemeType themeType) {
    _prefs.then((prefs) => prefs.setInt(_themeType, themeType.index));
  }

  @override
  Future<Locale?> getLocale() {
    return _prefs
        .then((prefs) => prefs.getString(_locale))
        .then((value) => value != null ? Locale(value) : null);
  }

  @override
  void saveLocale(Locale locale) {
    _prefs.then((prefs) => prefs.setString(_locale, locale.languageCode));
  }
}

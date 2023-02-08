import 'package:survey_sdk/data/data_sources/preferences_data_source.dart';
import 'package:survey_sdk/domain/data_interfaces/i_theme_repository.dart';
import 'package:survey_sdk/domain/entities/theme_type.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final PreferencesDataSource _preferencesDataSource;

  ThemeRepositoryImpl(this._preferencesDataSource);

  @override
  Future<ThemeType> getTheme() async {
    return await _preferencesDataSource.getThemeType() ?? ThemeType.system;
  }

  @override
  void saveThemeType(ThemeType themeType) {
    _preferencesDataSource.saveThemeType(themeType);
  }
}

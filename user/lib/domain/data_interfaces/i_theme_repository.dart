import 'package:survey_sdk/domain/entities/theme_type.dart';

abstract class ThemeRepository {
  Future<ThemeType> getTheme();
  void saveThemeType(ThemeType themeType);
}

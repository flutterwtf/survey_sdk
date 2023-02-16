import 'package:core/core.dart';

abstract class ThemeRepository {
  Future<ThemeType> getTheme();
  void saveThemeType(ThemeType themeType);
}

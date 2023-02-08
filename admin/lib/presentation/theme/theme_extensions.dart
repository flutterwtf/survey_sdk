import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/theme/theme_provider.dart';

import 'app_theme.dart';

extension ThemeExtensions on BuildContext {
  AppTheme get theme {
    return ThemeProvider.of(this).theme;
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/utils/app_fonts.dart';

import 'app_themes.dart';

class AppTheme extends Equatable {
  final ThemeData theme;
  final bool isDark;

  final Color primaryBackgroundColor;

  final Color textColor;

  const AppTheme({
    required this.isDark,
    required this.theme,
    required this.primaryBackgroundColor,
    required this.textColor,
  });

  @override
  List<Object?> get props => [
        theme,
        primaryBackgroundColor,
      ];
}

extension TextStylesExtensions on AppTheme {
  TextStyle get base => TextStyle(
        fontFamily: mainFontFamily,
        color: textColor,
        fontWeight: AppFonts.weightRegular,
      );


  TextStyle get textM => base.copyWith(fontSize: AppFonts.sizeM);

  TextStyle get textMMedium => textM.copyWith(fontWeight: AppFonts.weightMedium);
}

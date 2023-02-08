import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/utils/app_fonts.dart';
import 'package:survey_sdk/presentation/utils/colors.dart';

import 'app_theme.dart';


//TODO: replace with used font
const String mainFontFamily = 'Poppins';

final darkTheme = AppTheme(
  isDark: true,
  theme: ThemeData(
    primarySwatch: Colors.grey,
    fontFamily: mainFontFamily,
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.dark,
      textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(fontFamily: mainFontFamily),
        dateTimePickerTextStyle: TextStyle(color: AppColors.white, fontSize: AppFonts.sizeM),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.accentGreen,
      selectionHandleColor: AppColors.accentGreen,
      selectionColor: AppColors.accentGreen.withOpacity(0.5),
    ),
  ),
  primaryBackgroundColor: AppColors.whitePrimaryBackground,
  textColor: AppColors.text,
);

final lightTheme = AppTheme(
  isDark: false,
  theme: ThemeData(
    primarySwatch: Colors.grey,
    fontFamily: mainFontFamily,
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.dark,
      textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(fontFamily: mainFontFamily),
        dateTimePickerTextStyle: TextStyle(color: AppColors.white, fontSize: AppFonts.sizeM),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.accentGreen,
      selectionHandleColor: AppColors.accentGreen,
      selectionColor: AppColors.accentGreen.withOpacity(0.5),
    ),
  ),
  primaryBackgroundColor: AppColors.whitePrimaryBackground,
  textColor: AppColors.text,
);

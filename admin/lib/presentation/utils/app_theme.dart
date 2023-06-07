import 'package:flutter/material.dart';
import 'package:survey_sdk/survey_sdk.dart';

abstract class AppTheme {
  static final theme = ThemeData(
    appBarTheme: const AppBarTheme(
      toolbarHeight: SurveyDimensions.appbarHeight,
      shadowColor: SurveyColors.transparentW,
      backgroundColor: SurveyColors.white,
    ),
    listTileTheme: const ListTileThemeData(
      selectedColor: SurveyColors.black,
      selectedTileColor: SurveyColors.greyBackground,
    ),
    dividerTheme: const DividerThemeData(
      space: SurveyDimensions.thinBorderWidth,
      color: SurveyColors.greyBackground,
      thickness: SurveyDimensions.thinBorderWidth,
    ),
    iconTheme: const IconThemeData(
      color: SurveyColors.black,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: SurveyColors.black,
      unselectedLabelColor: SurveyColors.tabBarInactiveText,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(SurveyColors.black),
      ),
    ),
    fontFamily: SurveyFonts.inter,
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: SurveyColors.black),
      titleSmall: TextStyle(
        color: SurveyColors.black,
        fontWeight: SurveyFonts.weightSemiBold,
      ),
      bodyLarge: TextStyle(color: SurveyColors.black),
      bodyMedium: TextStyle(color: SurveyColors.black),
      bodySmall: TextStyle(color: SurveyColors.black),
      labelLarge: TextStyle(
        color: SurveyColors.black,
        fontWeight: SurveyFonts.weightBold,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(foregroundColor: SurveyColors.black),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: SurveyColors.black,
    ),
  );
}

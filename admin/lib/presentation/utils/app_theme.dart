import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';

abstract class AppTheme {
  static final theme = ThemeData(
    appBarTheme: const AppBarTheme(
      toolbarHeight: AppDimensions.appbarHeight,
      shadowColor: AppColors.transparentW,
      backgroundColor: AppColors.white,
    ),
    listTileTheme: const ListTileThemeData(
      selectedColor: AppColors.black,
      selectedTileColor: AppColors.greyBackground,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.greyBackground,
      thickness: AppDimensions.thinBorderWidth,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.black,
    ),
    tabBarTheme: const TabBarTheme().copyWith(
      labelColor: AppColors.black,
      unselectedLabelColor: AppColors.customizationTabBarInactiveText,
      indicatorColor: AppColors.black,
      indicatorSize: TabBarIndicatorSize.label,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.black),
      ),
    ),
    fontFamily: AppFonts.inter,
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: AppColors.black),
      titleSmall: TextStyle(
        color: AppColors.black,
        fontWeight: AppFonts.weightSemiBold,
      ),
      bodyLarge: TextStyle(color: AppColors.black),
      bodyMedium: TextStyle(color: AppColors.black),
      bodySmall: TextStyle(color: AppColors.black),
      labelLarge: TextStyle(
        color: AppColors.black,
        fontWeight: AppFonts.weightBold,
      ),
    ),
  );
}

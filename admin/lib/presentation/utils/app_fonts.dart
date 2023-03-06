import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/colors.dart';

// TODO(dev): it looks like core class.
// TODO(dev): folder structure is weird. We need better constants
//  folder organization. Maybe it's better to move something to the core module.
class AppFonts {
  static const FontWeight weightBold = FontWeight.w700;
  static const FontWeight weightSemiBold = FontWeight.w600;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightRegular = FontWeight.w400;

  static const inter = 'Inter';
  static const karla = 'Karla';

  static const double sizeXS = 10;
  static const double sizeS = 12;
  static const double sizeM = 14;
  static const double sizeL = 16;
  static const double sizeXL = 18;
  static const double size2XL = 25;
  static const double size3XL = 28;
}

extension AppTextThemeExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension CustomStyles on TextTheme {
  TextStyle get headLineMediumBold => const TextStyle(
        fontSize: AppFonts.sizeL,
        fontWeight: AppFonts.weightBold,
        color: AppColors.black,
      );

  TextStyle get buttonNameDark => const TextStyle(
        fontSize: AppFonts.sizeM,
        fontWeight: AppFonts.weightMedium,
        color: AppColors.white,
        letterSpacing: 0.1,
      );
  TextStyle get buttonNameLight => const TextStyle(
        fontSize: AppFonts.sizeM,
        fontWeight: AppFonts.weightBold,
        color: AppColors.black,
      );
}

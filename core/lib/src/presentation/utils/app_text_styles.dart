import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';

class AppTextStyles {
  //Family
  static TextStyle get inter => const TextStyle(
        fontFamily: AppFonts.inter,
      );

  static TextStyle get karla => const TextStyle(
        fontFamily: AppFonts.karla,
      );

  //Size
  static TextStyle get karlaM => karla.copyWith(
        fontSize: AppFonts.sizeM,
      );

  static TextStyle get karlaS => karla.copyWith(
        fontSize: AppFonts.sizeS,
      );

  static TextStyle get karlaL => karla.copyWith(
        fontSize: AppFonts.sizeL,
      );

  static TextStyle get interM => inter.copyWith(
        fontSize: AppFonts.sizeM,
      );

  //Weight
  static TextStyle get karlaLBold => karlaL.copyWith(
        fontWeight: AppFonts.weightBold,
      );

  static TextStyle get karlaMBold => karlaM.copyWith(
        fontWeight: AppFonts.weightBold,
      );

  //Color
  static TextStyle get karlaSBlack => karlaS.copyWith(
        color: AppColors.black,
      );

  static TextStyle get karlaMBoldWhite => karlaMBold.copyWith(
        color: AppColors.white,
      );
}

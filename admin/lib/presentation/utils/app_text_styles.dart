import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';

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

  static TextStyle get interL => inter.copyWith(
        fontSize: AppFonts.sizeL,
      );

  static TextStyle get interS => inter.copyWith(
        fontSize: AppFonts.sizeS,
      );

  static TextStyle get interM => inter.copyWith(
        fontSize: AppFonts.sizeM,
      );

  //Weight
  static TextStyle get interMBold => interM.copyWith(
        fontWeight: AppFonts.weightBold,
      );

  static TextStyle get interMMedium => interM.copyWith(
        fontWeight: AppFonts.weightMedium,
      );

  static TextStyle get interMSemiBold => interM.copyWith(
        fontWeight: AppFonts.weightSemiBold,
      );

  static TextStyle get interLSemiBold => interL.copyWith(
        fontWeight: AppFonts.weightSemiBold,
      );

  static TextStyle get interLMedium => interL.copyWith(
        fontWeight: AppFonts.weightMedium,
      );

  static TextStyle get interLBold => interL.copyWith(
        fontWeight: AppFonts.weightBold,
      );

  static TextStyle get karlaMBold => karlaM.copyWith(
        fontWeight: AppFonts.weightBold,
      );

  //Color
  static TextStyle get interLBoldBlack => interLBold.copyWith(
        color: AppColors.black,
      );

  static TextStyle get interMBlack => interM.copyWith(
        color: AppColors.black,
      );

  static TextStyle get interLSemiBoldBlack => interLSemiBold.copyWith(
        color: AppColors.black,
      );

  static TextStyle get interLBlack => interL.copyWith(
        color: AppColors.black,
      );

  static TextStyle get karlaMBoldBlack => karlaMBold.copyWith(
        color: AppColors.text,
      );

  static TextStyle get karlaMBoldWhite => karlaMBold.copyWith(
        color: AppColors.white,
      );

  static TextStyle get interSGrey => interS.copyWith(
        color: AppColors.textGrey,
      );

  static TextStyle get interBlack => inter.copyWith(
        color: AppColors.black,
      );
}

import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/presentation/utils/app_colors.dart';
import 'package:survey_core/src/presentation/utils/app_dimensions.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';

class IntroQuestionTheme extends ThemeExtension<IntroQuestionTheme>
    with ApiObject, EquatableMixin {
  final Color fillColor;
  final Color titleTextColor;
  final double titleTextSize;
  final Color subTitleTextColor;
  final double subTitleTextSize;
  final Color mainButtonColor;
  final Color mainButtonTextColor;
  final double mainButtonTextSize;
  final double mainButtonRadius;

  @override
  List<Object?> get props => [
        fillColor,
        titleTextColor,
        titleTextSize,
        subTitleTextColor,
        subTitleTextSize,
        mainButtonColor,
        mainButtonTextColor,
        mainButtonTextSize,
        mainButtonRadius,
      ];

  const IntroQuestionTheme({
    required this.fillColor,
    required this.titleTextColor,
    required this.titleTextSize,
    required this.subTitleTextColor,
    required this.subTitleTextSize,
    required this.mainButtonColor,
    required this.mainButtonTextColor,
    required this.mainButtonTextSize,
    required this.mainButtonRadius,
  });

  const IntroQuestionTheme.common()
      : this(
          fillColor: AppColors.white,
          titleTextColor: AppColors.black,
          titleTextSize: AppFonts.sizeL,
          subTitleTextColor: AppColors.black,
          subTitleTextSize: AppFonts.sizeS,
          mainButtonColor: AppColors.black,
          mainButtonTextColor: AppColors.white,
          mainButtonTextSize: AppFonts.sizeS,
          mainButtonRadius: AppDimensions.circularRadiusS,
        );

  IntroQuestionTheme.fromJson(Map<String, dynamic> json)
      : fillColor = Color(int.parse(json['fillColor'].toString())),
        titleTextColor = Color(int.parse(json['titleTextColor'].toString())),
        titleTextSize = double.parse(json['titleTextSize'].toString()),
        subTitleTextColor =
            Color(int.parse(json['subTitleTextColor'].toString())),
        subTitleTextSize = double.parse(json['subTitleTextSize'].toString()),
        mainButtonColor = Color(int.parse(json['mainButtonColor'].toString())),
        mainButtonTextColor =
            Color(int.parse(json['mainButtonTextColor'].toString())),
        mainButtonTextSize =
            double.parse(json['mainButtonTextSize'].toString()),
        mainButtonRadius = double.parse(json['mainButtonRadius'].toString());

  @override
  ThemeExtension<IntroQuestionTheme> copyWith({
    Color? fillColor,
    Color? titleTextColor,
    double? titleTextSize,
    Color? subTitleTextColor,
    double? subTitleTextSize,
    Color? mainButtonColor,
    Color? mainButtonTextColor,
    double? mainButtonTextSize,
    double? mainButtonRadius,
  }) {
    return IntroQuestionTheme(
      fillColor: fillColor ?? this.fillColor,
      titleTextColor: titleTextColor ?? this.titleTextColor,
      titleTextSize: titleTextSize ?? this.titleTextSize,
      subTitleTextColor: subTitleTextColor ?? this.subTitleTextColor,
      subTitleTextSize: subTitleTextSize ?? this.subTitleTextSize,
      mainButtonColor: mainButtonColor ?? this.mainButtonColor,
      mainButtonTextColor: mainButtonTextColor ?? this.mainButtonTextColor,
      mainButtonTextSize: mainButtonTextSize ?? this.mainButtonTextSize,
      mainButtonRadius: mainButtonRadius ?? this.mainButtonRadius,
    );
  }

  @override
  ThemeExtension<IntroQuestionTheme> lerp(
    covariant ThemeExtension<IntroQuestionTheme>? other,
    double t,
  ) {
    if (other is! IntroQuestionTheme) {
      return this;
    }
    return IntroQuestionTheme(
      fillColor: Color.lerp(fillColor, other.fillColor, t)!,
      titleTextColor: Color.lerp(titleTextColor, other.titleTextColor, t)!,
      titleTextSize: lerpDouble(titleTextSize, other.titleTextSize, t)!,
      subTitleTextColor:
          Color.lerp(subTitleTextColor, other.subTitleTextColor, t)!,
      subTitleTextSize:
          lerpDouble(subTitleTextSize, other.subTitleTextSize, t)!,
      mainButtonColor: Color.lerp(mainButtonColor, other.mainButtonColor, t)!,
      mainButtonTextColor:
          Color.lerp(mainButtonTextColor, other.mainButtonTextColor, t)!,
      mainButtonTextSize:
          lerpDouble(mainButtonTextSize, other.mainButtonTextSize, t)!,
      mainButtonRadius:
          lerpDouble(mainButtonRadius, other.mainButtonRadius, t)!,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'fillColor': fillColor.value,
        'titleTextColor': titleTextColor.value,
        'titleTextSize': titleTextSize,
        'subTitleTextColor': subTitleTextColor.value,
        'subTitleTextSize': subTitleTextSize,
        'mainButtonColor': mainButtonColor.value,
        'mainButtonTextColor': mainButtonTextColor.value,
        'mainButtonTextSize': mainButtonTextSize,
        'mainButtonRadius': mainButtonRadius,
      };
}

import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/presentation/utils/app_colors.dart';
import 'package:survey_core/src/presentation/utils/app_dimensions.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/utils.dart';

class IntroQuestionTheme extends ThemeExtension<IntroQuestionTheme>
    with ApiObject, EquatableMixin {
  final Color fill;
  final Color titleColor;
  final double titleSize;
  final Color subtitleColor;
  final double subtitleSize;
  final Color buttonFill;
  final Color buttonTextColor;
  final double buttonTextSize;
  final double buttonRadius;

  @override
  List<Object?> get props => [
        fill,
        titleColor,
        titleSize,
        subtitleColor,
        subtitleSize,
        buttonFill,
        buttonTextColor,
        buttonTextSize,
        buttonRadius,
      ];

  const IntroQuestionTheme({
    required this.fill,
    required this.titleColor,
    required this.titleSize,
    required this.subtitleColor,
    required this.subtitleSize,
    required this.buttonFill,
    required this.buttonTextColor,
    required this.buttonTextSize,
    required this.buttonRadius,
  });

  const IntroQuestionTheme.common()
      : this(
          fill: AppColors.white,
          titleColor: AppColors.black,
          titleSize: AppFonts.sizeL,
          subtitleColor: AppColors.black,
          subtitleSize: AppFonts.sizeS,
          buttonFill: AppColors.black,
          buttonTextColor: AppColors.white,
          buttonTextSize: AppFonts.sizeS,
          buttonRadius: AppDimensions.circularRadiusS,
        );

  // TODO(dev): rewrite.
  IntroQuestionTheme.fromJson(Map<String, dynamic> json)
      : fill = Color(int.parse(json['fill'].toString())),
        titleColor = Color(int.parse(json['titleColor'].toString())),
        titleSize = double.parse(json['titleSize'].toString()),
        subtitleColor =
            Color(int.parse(json['subtitleColor'].toString())),
        subtitleSize = double.parse(json['subtitleSize'].toString()),
        buttonFill = Color(int.parse(json['buttonFill'].toString())),
        buttonTextColor =
            Color(int.parse(json['buttonTextColor'].toString())),
        buttonTextSize =
            double.parse(json['buttonTextSize'].toString()),
        buttonRadius = double.parse(json['buttonRadius'].toString());

  @override
  IntroQuestionTheme copyWith({
    Color? fill,
    Color? titleColor,
    double? titleSize,
    Color? subtitleColor,
    double? subtitleSize,
    Color? buttonFill,
    Color? buttonTextColor,
    double? buttonTextSize,
    double? buttonRadius,
  }) {
    return IntroQuestionTheme(
      fill: fill ?? this.fill,
      titleColor: titleColor ?? this.titleColor,
      titleSize: titleSize ?? this.titleSize,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      subtitleSize: subtitleSize ?? this.subtitleSize,
      buttonFill: buttonFill ?? this.buttonFill,
      buttonTextColor: buttonTextColor ?? this.buttonTextColor,
      buttonTextSize: buttonTextSize ?? this.buttonTextSize,
      buttonRadius: buttonRadius ?? this.buttonRadius,
    );
  }

  @override
  IntroQuestionTheme lerp(
    covariant IntroQuestionTheme? other,
    double t,
  ) {
    if (other is! IntroQuestionTheme) {
      return this;
    }
    return IntroQuestionTheme(
      fill: Color.lerp(fill, other.fill, t)!,
      titleColor: Color.lerp(titleColor, other.titleColor, t)!,
      titleSize: lerpDouble(titleSize, other.titleSize, t)!,
      subtitleColor:
          Color.lerp(subtitleColor, other.subtitleColor, t)!,
      subtitleSize:
          lerpDouble(subtitleSize, other.subtitleSize, t)!,
      buttonFill: Color.lerp(buttonFill, other.buttonFill, t)!,
      buttonTextColor:
          Color.lerp(buttonTextColor, other.buttonTextColor, t)!,
      buttonTextSize:
          lerpDouble(buttonTextSize, other.buttonTextSize, t)!,
      buttonRadius:
          lerpDouble(buttonRadius, other.buttonRadius, t)!,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'fill': fill.value,
        'titleColor': titleColor.value,
        'titleSize': titleSize,
        'subtitleColor': subtitleColor.value,
        'subtitleSize': subtitleSize,
        'buttonFill': buttonFill.value,
        'buttonTextColor': buttonTextColor.value,
        'buttonTextSize': buttonTextSize,
        'buttonRadius': buttonRadius,
      };
}

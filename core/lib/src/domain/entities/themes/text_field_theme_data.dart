// TODO(dev): rewrite this to TextFieldTheme PLS

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';

@immutable
class TextFieldThemeData extends ThemeExtension<TextFieldThemeData>
    with ApiObject {
  final Color fillCommonColor;
  final Color fillInputColor;
  final Color borderColor;
  final double borderWidth;
  final double verticalPadding;
  final double horizontalPadding;
  final Color hintColor;
  final double hintSize;
  final Color textColor;
  final double textSize;
  final Color titleColor;
  final double titleSize;
  final Color subtitleColor;
  final double subtitleSize;
  final double buttonTextSize;
  final Color buttonColor;
  final Color buttonTextColor;

  const TextFieldThemeData({
    required this.fillCommonColor,
    required this.fillInputColor,
    required this.borderColor,
    required this.borderWidth,
    required this.verticalPadding,
    required this.horizontalPadding,
    required this.hintColor,
    required this.hintSize,
    required this.textColor,
    required this.textSize,
    required this.titleColor,
    required this.titleSize,
    required this.subtitleColor,
    required this.subtitleSize,
    required this.buttonTextSize,
    required this.buttonColor,
    required this.buttonTextColor,
  });

  const TextFieldThemeData.common()
      : this(
          fillCommonColor: AppColors.white,
          fillInputColor: AppColors.white,
          borderColor: AppColors.black,
          borderWidth: AppDimensions.circularRadiusXS,
          verticalPadding: AppDimensions.marginM,
          horizontalPadding: AppDimensions.marginM,
          hintColor: AppColors.textGrey,
          hintSize: AppDimensions.marginM,
          textColor: AppColors.black,
          textSize: AppDimensions.marginM,
          titleColor: AppColors.black,
          titleSize: AppDimensions.marginM,
          subtitleColor: AppColors.black,
          subtitleSize: AppDimensions.marginS,
          buttonTextSize: AppDimensions.marginS,
          buttonColor: AppColors.black,
          buttonTextColor: AppColors.white,
        );

  TextFieldThemeData.fromJson(Map<String, dynamic> json)
      : fillCommonColor = Color(json['fillCommonColor']),
        fillInputColor = Color(json['fillInputColor']),
        borderColor = Color(json['borderColor']),
        borderWidth = json['borderWidth'],
        verticalPadding = json['verticalPadding'],
        horizontalPadding = json['horizontalPadding'],
        hintColor = Color(json['hintColor']),
        hintSize = json['hintSize'],
        textColor = Color(json['textColor']),
        textSize = json['textSize'],
        titleColor = Color(json['titleColor']),
        titleSize = json['titleSize'],
        subtitleColor = Color(json['subtitleColor']),
        subtitleSize = json['subtitleSize'],
        buttonTextSize = json['buttonTextSize'],
        buttonColor = Color(json['buttonColor']),
        buttonTextColor = Color(json['buttonTextColor']);

  @override
  Map<String, dynamic> toJson() => {
        'fillCommonColor': fillCommonColor.value,
        'fillInputColor': fillInputColor.value,
        'borderColor': borderColor.value,
        'borderWidth': borderWidth,
        'verticalPadding': verticalPadding,
        'horizontalPadding': horizontalPadding,
        'hintColor': hintColor.value,
        'hintSize': hintSize,
        'textColor': textColor.value,
        'textSize': textSize,
        'titleColor': titleColor.value,
        'titleSize': titleSize,
        'subtitleColor': subtitleColor.value,
        'subtitleSize': subtitleSize,
        'buttonTextSize': buttonTextSize,
        'buttonColor': buttonColor.value,
        'buttonTextColor': buttonTextColor.value,
      };

  @override
  ThemeExtension<TextFieldThemeData> copyWith({
    Color? fillCommonColor,
    Color? fillInputColor,
    Color? borderColor,
    double? borderWidth,
    double? verticalPadding,
    double? horizontalPadding,
    Color? hintColor,
    double? hintSize,
    Color? textColor,
    double? textSize,
    Color? titleColor,
    double? titleSize,
    Color? subtitleColor,
    double? subtitleSize,
    double? buttonTextSize,
    Color? buttonColor,
    Color? buttonTextColor,
  }) {
    return TextFieldThemeData(
      fillCommonColor: fillCommonColor ?? this.fillCommonColor,
      fillInputColor: fillInputColor ?? this.fillInputColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      verticalPadding: verticalPadding ?? this.verticalPadding,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      hintColor: hintColor ?? this.hintColor,
      hintSize: hintSize ?? this.hintSize,
      textColor: textColor ?? this.textColor,
      textSize: textSize ?? this.textSize,
      titleColor: titleColor ?? this.titleColor,
      titleSize: titleSize ?? this.titleSize,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      subtitleSize: subtitleSize ?? this.subtitleSize,
      buttonTextSize: buttonTextSize ?? this.buttonTextSize,
      buttonColor: buttonColor ?? this.buttonColor,
      buttonTextColor: buttonTextColor ?? this.buttonTextColor,
    );
  }

  @override
  ThemeExtension<TextFieldThemeData> lerp(
    covariant ThemeExtension<TextFieldThemeData>? other,
    double t,
  ) {
    if (other is! TextFieldThemeData) {
      return this;
    }
    return TextFieldThemeData(
      fillCommonColor: Color.lerp(fillCommonColor, other.fillCommonColor, t)!,
      fillInputColor: Color.lerp(fillInputColor, other.fillInputColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t)!,
      verticalPadding: lerpDouble(verticalPadding, other.verticalPadding, t)!,
      horizontalPadding:
          lerpDouble(horizontalPadding, other.horizontalPadding, t)!,
      hintColor: Color.lerp(hintColor, other.hintColor, t)!,
      hintSize: lerpDouble(hintSize, other.hintSize, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      textSize: lerpDouble(textSize, other.textSize, t)!,
      titleColor: Color.lerp(titleColor, other.titleColor, t)!,
      titleSize: lerpDouble(titleSize, other.titleSize, t)!,
      subtitleColor: Color.lerp(subtitleColor, other.subtitleColor, t)!,
      subtitleSize: lerpDouble(subtitleSize, other.subtitleSize, t)!,
      buttonTextSize: lerpDouble(buttonTextSize, other.buttonTextSize, t)!,
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t)!,
      buttonTextColor: Color.lerp(buttonTextColor, other.buttonTextColor, t)!,
    );
  }
}

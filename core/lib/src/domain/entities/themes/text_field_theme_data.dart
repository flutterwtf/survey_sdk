import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/presentation/utils/app_colors.dart';
import 'package:survey_core/src/presentation/utils/app_dimensions.dart';

/// Defines the visual properties for text field
@immutable
class TextFieldThemeData extends ThemeExtension<TextFieldThemeData>
    with ApiObject, EquatableMixin {
  /// Color for the background fill of the text field and input section
  final Color fillCommonColor;

  /// Color for the background fill of the input field
  final Color fillInputColor;

  /// Color for the border of the input field
  final Color borderColor;

  /// Width of the border for the input field
  final double borderWidth;

  /// Vertical padding for the input field
  final double verticalPadding;

  /// Horizontal padding for the input field
  final double horizontalPadding;

  /// Color for the hint text
  final Color hintColor;

  /// Size of the hint text
  final double hintSize;

  /// Color for the text of the input field
  final Color textColor;

  /// Size of the text of the input field
  final double textSize;

  /// Color for the title text of the input section
  final Color titleColor;

  /// Size of the title text of the input section
  final double titleSize;

  /// Color for the subtitle text of the input section
  final Color subtitleColor;

  /// Size of the subtitle text of the input section
  final double subtitleSize;

  /// Size of the text of the button
  final double buttonTextSize;

  /// Color for the background of the button
  final Color buttonColor;

  /// Color for the text of the button
  final Color buttonTextColor;

  @override
  List<Object?> get props => [
        fillCommonColor,
        fillInputColor,
        borderColor,
        borderWidth,
        verticalPadding,
        horizontalPadding,
        hintColor,
        hintSize,
        textColor,
        textSize,
        titleColor,
        titleSize,
        subtitleColor,
        subtitleSize,
        buttonTextSize,
        buttonColor,
        buttonTextColor,
      ];

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

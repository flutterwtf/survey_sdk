import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/presentation/utils/utils.dart';

/// Defines the visual properties for an intro question page
class IntroQuestionTheme extends ThemeExtension<IntroQuestionTheme>
    with ApiObject, EquatableMixin {
  /// Background color of the intro page
  final Color fill;

  /// Color of the title text
  final Color titleColor;

  /// Font size of the title text
  final double titleSize;

  /// Color of the subtitle text
  final Color subtitleColor;

  /// Font size of the subtitle text
  final double subtitleSize;

  /// Background color of the main button
  final Color buttonFill;

  /// Color of the text on the main button
  final Color buttonTextColor;

  /// Font size of the text on the main button
  final double buttonTextSize;

  /// Border radius of the main button
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

  /// Default color values of intro question page
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

  factory IntroQuestionTheme.fromJson(Map<String, dynamic> json) {
    return IntroQuestionTheme(
      fill: Color(json['fill']),
      titleColor: Color(json['titleColor']),
      titleSize: json['titleSize'],
      subtitleColor: Color(json['subtitleColor']),
      subtitleSize: json['subtitleSize'],
      buttonFill: Color(json['buttonFill']),
      buttonTextColor: Color(json['buttonTextColor']),
      buttonTextSize: json['buttonTextSize'],
      buttonRadius: json['buttonRadius'],
    );
  }

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
      subtitleColor: Color.lerp(subtitleColor, other.subtitleColor, t)!,
      subtitleSize: lerpDouble(subtitleSize, other.subtitleSize, t)!,
      buttonFill: Color.lerp(buttonFill, other.buttonFill, t)!,
      buttonTextColor: Color.lerp(buttonTextColor, other.buttonTextColor, t)!,
      buttonTextSize: lerpDouble(buttonTextSize, other.buttonTextSize, t)!,
      buttonRadius: lerpDouble(buttonRadius, other.buttonRadius, t)!,
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

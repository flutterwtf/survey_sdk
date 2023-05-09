import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/api_object.dart';
import 'package:survey_sdk/src/presentation/utils/utils.dart';

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
  final Color primaryButtonFill;

  /// Color of the text on the main button
  final Color primaryButtonTextColor;

  /// Font size of the text on the main button
  final double primaryButtonTextSize;

  /// Border radius of the main button
  final double primaryButtonRadius;

  /// Background color of the secondary button
  final Color secondaryButtonFill;

  /// Color of the text on the secondary button
  final Color secondaryButtonTextColor;

  /// Font size of the text on the secondary button
  final double secondaryButtonTextSize;

  /// Border radius of the secondary button
  final double secondaryButtonRadius;

  @override
  List<Object?> get props => [
        fill,
        titleColor,
        titleSize,
        subtitleColor,
        subtitleSize,
        primaryButtonFill,
        primaryButtonTextColor,
        primaryButtonTextSize,
        primaryButtonRadius,
        secondaryButtonFill,
        secondaryButtonTextColor,
        secondaryButtonTextSize,
        secondaryButtonRadius,
      ];

  const IntroQuestionTheme({
    required this.fill,
    required this.titleColor,
    required this.titleSize,
    required this.subtitleColor,
    required this.subtitleSize,
    required this.primaryButtonFill,
    required this.primaryButtonTextColor,
    required this.primaryButtonTextSize,
    required this.primaryButtonRadius,
    required this.secondaryButtonFill,
    required this.secondaryButtonTextColor,
    required this.secondaryButtonTextSize,
    required this.secondaryButtonRadius,
  });

  /// Default color values of intro question page
  const IntroQuestionTheme.common()
      : this(
          fill: AppColors.white,
          titleColor: AppColors.black,
          titleSize: AppFonts.sizeL,
          subtitleColor: AppColors.black,
          subtitleSize: AppFonts.sizeS,
          primaryButtonFill: AppColors.black,
          primaryButtonTextColor: AppColors.white,
          primaryButtonTextSize: AppFonts.sizeS,
          primaryButtonRadius: AppDimensions.circularRadiusS,
          secondaryButtonFill: AppColors.black,
          secondaryButtonTextColor: AppColors.white,
          secondaryButtonTextSize: AppFonts.sizeS,
          secondaryButtonRadius: AppDimensions.circularRadiusS,
        );

  factory IntroQuestionTheme.fromJson(Map<String, dynamic> json) {
    return IntroQuestionTheme(
      fill: Color(json['fill']),
      titleColor: Color(json['titleColor']),
      titleSize: json['titleSize'],
      subtitleColor: Color(json['subtitleColor']),
      subtitleSize: json['subtitleSize'],
      primaryButtonFill: Color(json['primaryButtonFill']),
      primaryButtonTextColor: Color(json['primaryButtonTextColor']),
      primaryButtonTextSize: json['primaryButtonTextSize'],
      primaryButtonRadius: json['primaryButtonRadius'],
      secondaryButtonFill: Color(json['secondaryButtonFill']),
      secondaryButtonTextColor: Color(json['secondaryButtonTextColor']),
      secondaryButtonTextSize: json['secondaryButtonTextSize'],
      secondaryButtonRadius: json['secondaryButtonRadius'],
    );
  }

  @override
  IntroQuestionTheme copyWith({
    Color? fill,
    Color? titleColor,
    double? titleSize,
    Color? subtitleColor,
    double? subtitleSize,
    Color? primaryButtonFill,
    Color? primaryButtonTextColor,
    double? primaryButtonTextSize,
    double? primaryButtonRadius,
    Color? secondaryButtonFill,
    Color? secondaryButtonTextColor,
    double? secondaryButtonTextSize,
    double? secondaryButtonRadius,
  }) {
    return IntroQuestionTheme(
      fill: fill ?? this.fill,
      titleColor: titleColor ?? this.titleColor,
      titleSize: titleSize ?? this.titleSize,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      subtitleSize: subtitleSize ?? this.subtitleSize,
      primaryButtonFill: primaryButtonFill ?? this.primaryButtonFill,
      primaryButtonTextColor:
          primaryButtonTextColor ?? this.primaryButtonTextColor,
      primaryButtonTextSize:
          primaryButtonTextSize ?? this.primaryButtonTextSize,
      primaryButtonRadius: primaryButtonRadius ?? this.primaryButtonRadius,
      secondaryButtonFill: secondaryButtonFill ?? this.secondaryButtonFill,
      secondaryButtonTextColor:
          secondaryButtonTextColor ?? this.secondaryButtonTextColor,
      secondaryButtonTextSize:
          secondaryButtonTextSize ?? this.secondaryButtonTextSize,
      secondaryButtonRadius:
          secondaryButtonRadius ?? this.secondaryButtonRadius,
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
      primaryButtonFill: Color.lerp(
        primaryButtonFill,
        other.primaryButtonFill,
        t,
      )!,
      primaryButtonTextColor: Color.lerp(
        primaryButtonTextColor,
        other.primaryButtonTextColor,
        t,
      )!,
      primaryButtonTextSize: lerpDouble(
        primaryButtonTextSize,
        other.primaryButtonTextSize,
        t,
      )!,
      primaryButtonRadius: lerpDouble(
        primaryButtonRadius,
        other.primaryButtonRadius,
        t,
      )!,
      secondaryButtonFill: Color.lerp(
        secondaryButtonFill,
        other.secondaryButtonFill,
        t,
      )!,
      secondaryButtonTextColor: Color.lerp(
        secondaryButtonTextColor,
        other.secondaryButtonTextColor,
        t,
      )!,
      secondaryButtonTextSize: lerpDouble(
        secondaryButtonTextSize,
        other.secondaryButtonTextSize,
        t,
      )!,
      secondaryButtonRadius: lerpDouble(
        secondaryButtonRadius,
        other.secondaryButtonRadius,
        t,
      )!,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'fill': fill.value,
        'titleColor': titleColor.value,
        'titleSize': titleSize,
        'subtitleColor': subtitleColor.value,
        'subtitleSize': subtitleSize,
        'primaryButtonFill': primaryButtonFill.value,
        'primaryButtonTextColor': primaryButtonTextColor.value,
        'primaryButtonTextSize': primaryButtonTextSize,
        'primaryButtonRadius': primaryButtonRadius,
        'secondaryButtonFill': secondaryButtonFill.value,
        'secondaryButtonTextColor': secondaryButtonTextColor.value,
        'secondaryButtonTextSize': secondaryButtonTextSize,
        'secondaryButtonRadius': secondaryButtonRadius,
      };
}

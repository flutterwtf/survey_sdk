import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/api_object.dart';
import 'package:survey_sdk/src/presentation/utils/app_colors.dart';

const _titleSize = 16.0;
const _subtitleSize = 12.0;
const _buttonTextSize = 12.0;
const _buttonRadius = 10.0;

/// Defines the visual properties for a choice question options
class ChoiceQuestionTheme extends ThemeExtension<ChoiceQuestionTheme>
    with ApiObject, EquatableMixin {
  /// Color of the active radio or checkbox option.
  /// By default is set to [Colors.black]
  final Color activeColor;

  /// Color of the inactive radio or checkbox option.
  /// By default is set to [Colors.grey]
  final Color inactiveColor;
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
        activeColor,
        inactiveColor,
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

  const ChoiceQuestionTheme({
    required this.activeColor,
    required this.inactiveColor,
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

  /// Default color values of choice question options
  const ChoiceQuestionTheme.common()
      : this(
          activeColor: AppColors.black,
          inactiveColor: AppColors.grey,
          fill: AppColors.white,
          titleColor: AppColors.black,
          titleSize: _titleSize,
          subtitleColor: AppColors.black,
          subtitleSize: _subtitleSize,
          buttonFill: AppColors.black,
          buttonTextColor: AppColors.white,
          buttonTextSize: _buttonTextSize,
          buttonRadius: _buttonRadius,
        );

  ChoiceQuestionTheme.fromJson(Map<String, dynamic> json)
      : activeColor = Color(json['activeColor']),
        inactiveColor = Color(json['inactiveColor']),
        fill = Color(json['fill']),
        titleColor = Color(json['titleColor']),
        titleSize = json['titleSize'],
        subtitleColor = Color(json['subtitleColor']),
        subtitleSize = json['subtitleSize'],
        buttonFill = Color(json['buttonFill']),
        buttonTextColor = Color(json['buttonTextColor']),
        buttonTextSize = json['buttonTextSize'],
        buttonRadius = json['buttonRadius'];

  @override
  ChoiceQuestionTheme copyWith({
    Color? activeColor,
    Color? inactiveColor,
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
    return ChoiceQuestionTheme(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
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
  ChoiceQuestionTheme lerp(
    covariant ChoiceQuestionTheme? other,
    double t,
  ) {
    if (other is! ChoiceQuestionTheme) {
      return this;
    }
    return ChoiceQuestionTheme(
      activeColor: Color.lerp(activeColor, other.activeColor, t)!,
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t)!,
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
        'activeColor': activeColor.value,
        'inactiveColor': inactiveColor.value,
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
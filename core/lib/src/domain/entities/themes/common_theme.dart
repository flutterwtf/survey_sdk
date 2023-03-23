import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';

class CommonTheme extends ThemeExtension<CommonTheme>
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
        sliderThemeData,
        textFieldThemeData,
      ];

  CommonTheme({
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

  factory CommonTheme.fromJson(Map<String, dynamic> json) {
    return CommonTheme(
      fill: json['fill'],
      titleColor: json['titleColor'],
      titleSize: json['titleSize'],
      subtitleColor: json['subtitleColor'],
      subtitleSize: json['subtitleSize'],
      buttonFill: json['buttonFill'],
      buttonTextColor: json['buttonTextColor'],
      buttonTextSize: json['buttonTextSize'],
      buttonRadius: json['buttonRadius'],
    );
  }

  @override
  CommonTheme copyWith({
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
    return CommonTheme(
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

  @override
  CommonTheme lerp(covariant CommonTheme? other, double t) {
    return CommonTheme(
      fill: Color.lerp(fill, other?.fill, t)!,
      titleColor: Color.lerp(titleColor, other?.titleColor, t)!,
      titleSize: lerpDouble(titleSize, other?.titleSize, t)!,
      subtitleColor: Color.lerp(subtitleColor, other?.subtitleColor, t)!,
      subtitleSize: lerpDouble(subtitleSize, other?.subtitleSize, t)!,
      buttonFill: Color.lerp(buttonFill, other?.buttonFill, t)!,
      buttonTextColor: Color.lerp(buttonTextColor, other?.buttonTextColor, t)!,
      buttonTextSize: lerpDouble(buttonTextSize, other?.buttonTextSize, t)!,
      buttonRadius: lerpDouble(buttonRadius, other?.buttonRadius, t)!,
    );
  }
}

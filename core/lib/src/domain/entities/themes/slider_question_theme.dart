import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';

const _thumbRadius = 16.0;
const _thickness = 8.0;
const _titleSize = 16.0;
const _subtitleSize = 12.0;
const _buttonTextSize = 12.0;
const _buttonRadius = 10.0;

// TODO(dev): Can we move equatable mixin to ApiObject?
class SliderQuestionTheme extends ThemeExtension<SliderQuestionTheme>
    with ApiObject, EquatableMixin {
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final double thumbRadius;
  final double thickness;
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
        thumbColor,
        thumbRadius,
        thickness,
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

  // TODO(dev): Add hint text.
  const SliderQuestionTheme({
    required this.activeColor,
    required this.inactiveColor,
    required this.thumbColor,
    required this.thumbRadius,
    required this.thickness,
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

  const SliderQuestionTheme.common()
      : this(
          activeColor: const Color(0xFF000000),
          inactiveColor: const Color(0xFFCCCCCC),
          thumbColor: const Color(0xFF000000),
          thumbRadius: _thumbRadius,
          thickness: _thickness,
          fill: Colors.white,
          titleColor: Colors.black,
          titleSize: _titleSize,
          subtitleColor: Colors.black,
          subtitleSize: _subtitleSize,
          buttonFill: Colors.black,
          buttonTextColor: Colors.white,
          buttonTextSize: _buttonTextSize,
          buttonRadius: _buttonRadius,
        );

  SliderQuestionTheme.fromJson(Map<String, dynamic> json)
      : activeColor = Color(json['activeColor']),
        inactiveColor = Color(json['inactiveColor']),
        thumbColor = Color(json['thumbColor']),
        thumbRadius = json['thumbRadius'],
        thickness = json['thickness'],
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
  Map<String, dynamic> toJson() => {
        'activeColor': activeColor.value,
        'inactiveColor': inactiveColor.value,
        'thumbColor': thumbColor.value,
        'thumbRadius': thumbRadius,
        'thickness': thickness,
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

  @override
  SliderQuestionTheme copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? thumbColor,
    double? thumbRadius,
    double? thickness,
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
    return SliderQuestionTheme(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      thumbColor: thumbColor ?? this.thumbColor,
      thumbRadius: thumbRadius ?? this.thumbRadius,
      thickness: thickness ?? this.thickness,
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
  SliderQuestionTheme lerp(
    covariant SliderQuestionTheme? other,
    double t,
  ) {
    if (other is! SliderQuestionTheme) {
      return this;
    }
    return SliderQuestionTheme(
      activeColor: Color.lerp(activeColor, other.activeColor, t)!,
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t)!,
      thumbColor: Color.lerp(thumbColor, other.thumbColor, t)!,
      thumbRadius: lerpDouble(thumbRadius, other.thumbRadius, t)!,
      thickness: lerpDouble(thickness, other.thickness, t)!,
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
}

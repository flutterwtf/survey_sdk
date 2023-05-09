import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/api_object.dart';

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
  final Color primaryButtonFill;
  final Color primaryButtonTextColor;
  final double primaryButtonTextSize;
  final double primaryButtonRadius;
  final Color secondaryButtonFill;
  final Color secondaryButtonTextColor;
  final double secondaryButtonTextSize;
  final double secondaryButtonRadius;
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
        primaryButtonFill,
        primaryButtonTextColor,
        primaryButtonTextSize,
        primaryButtonRadius,
        secondaryButtonFill,
        secondaryButtonTextColor,
        secondaryButtonTextSize,
        secondaryButtonRadius,
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
    required this.primaryButtonFill,
    required this.primaryButtonTextColor,
    required this.primaryButtonTextSize,
    required this.primaryButtonRadius,
    required this.secondaryButtonFill,
    required this.secondaryButtonTextColor,
    required this.secondaryButtonTextSize,
    required this.secondaryButtonRadius,
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
          primaryButtonFill: Colors.black,
          primaryButtonTextColor: Colors.white,
          primaryButtonTextSize: _buttonTextSize,
          primaryButtonRadius: _buttonRadius,
          secondaryButtonFill: Colors.black,
          secondaryButtonTextColor: Colors.white,
          secondaryButtonTextSize: _buttonTextSize,
          secondaryButtonRadius: _buttonRadius,
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
        primaryButtonFill = Color(json['primaryButtonFill']),
        primaryButtonTextColor = Color(json['primaryButtonTextColor']),
        primaryButtonTextSize = json['primaryButtonTextSize'],
        primaryButtonRadius = json['primaryButtonRadius'],
        secondaryButtonFill = Color(json['secondaryButtonFill']),
        secondaryButtonTextColor = Color(json['secondaryButtonTextColor']),
        secondaryButtonTextSize = json['secondaryButtonTextSize'],
        secondaryButtonRadius = json['secondaryButtonRadius'];

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
        'primaryButtonFill': primaryButtonFill.value,
        'primaryButtonTextColor': primaryButtonTextColor.value,
        'primaryButtonTextSize': primaryButtonTextSize,
        'primaryButtonRadius': primaryButtonRadius,
        'secondaryButtonFill': secondaryButtonFill.value,
        'secondaryButtonTextColor': secondaryButtonTextColor.value,
        'secondaryButtonTextSize': secondaryButtonTextSize,
        'secondaryButtonRadius': secondaryButtonRadius,
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
    Color? primaryButtonFill,
    Color? primaryButtonTextColor,
    double? primaryButtonTextSize,
    double? primaryButtonRadius,
    Color? secondaryButtonFill,
    Color? secondaryButtonTextColor,
    double? secondaryButtonTextSize,
    double? secondaryButtonRadius,
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
}

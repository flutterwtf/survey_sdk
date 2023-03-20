import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';

// TODO(dev): Can we move equatable mixin to ApiObject?
class SliderQuestionTheme extends ThemeExtension<SliderQuestionTheme>
    with ApiObject, EquatableMixin {
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final double thumbRadius;
  final double thickness;

  // TODO(dev): Add hint text.
  const SliderQuestionTheme({
    required this.activeColor,
    required this.inactiveColor,
    required this.thumbColor,
    required this.thumbRadius,
    required this.thickness,
  });

  SliderQuestionTheme.fromJson(Map<String, dynamic> json)
      : activeColor = Color(json['activeColor']),
        inactiveColor = Color(json['inactiveColor']),
        thumbColor = Color(json['thumbColor']),
        thumbRadius = json['thumbRadius'],
        thickness = json['thickness'];

  @override
  Map<String, dynamic> toJson() => {
        'activeColor': activeColor.value,
        'inactiveColor': inactiveColor.value,
        'thumbColor': thumbColor.value,
        'thumbRadius': thumbRadius,
        'thickness': thickness,
      };

  const SliderQuestionTheme.common()
      : this(
          activeColor: const Color(0xFF000000),
          inactiveColor: const Color(0xFFCCCCCC),
          thumbColor: const Color(0xFF000000),
          thumbRadius: 16.0,
          thickness: 8.0,
        );

  @override
  SliderQuestionTheme copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? thumbColor,
    double? thumbRadius,
    double? thickness,
  }) {
    return SliderQuestionTheme(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      thumbColor: thumbColor ?? this.thumbColor,
      thumbRadius: thumbRadius ?? this.thumbRadius,
      thickness: thickness ?? this.thickness,
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
    );
  }

  @override
  List<Object?> get props => [
        activeColor,
        inactiveColor,
        thumbColor,
        thumbRadius,
        thickness,
      ];
}

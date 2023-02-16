//TODO: rewrite this to TextFieldTheme PLS

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/domain/entities/themes/theme_extension_composable.dart';

@immutable
class TextFieldTheme extends ThemeExtension<TextFieldTheme> with ApiObject {
  final ThumbTheme thumbTheme;
  final double thickness;
  final Color activeColor;
  final Color inactiveColor;

  const TextFieldTheme({
    required this.thumbTheme,
    required this.thickness,
    required this.activeColor,
    required this.inactiveColor,
  });

  const TextFieldTheme.common()
      : this(
          thumbTheme: const ThumbTheme.common(),
          thickness: 8.0,
          activeColor: Colors.black,
          inactiveColor: const Color(0xFFCCCCCC),
        );

  TextFieldTheme.fromJson(Map<String, dynamic> json)
      : thumbTheme = ThumbTheme.fromJson(json['thumb']),
        thickness = json['thickness'],
        activeColor = Color(json['activeColor']),
        inactiveColor = Color(json['inactiveColor']);

  @override
  Map<String, dynamic> toJson() => {
        'thickness': thickness,
        'activeColor': activeColor.value,
        'inactiveColor': inactiveColor.value,
        'thumb': thumbTheme.toJson(),
      };

  @override
  ThemeExtension<TextFieldTheme> copyWith({
    ThumbTheme? thumbTheme,
    double? thickness,
    Color? activeColor,
    Color? inactiveColor,
  }) {
    return TextFieldTheme(
      thumbTheme: thumbTheme ?? this.thumbTheme,
      thickness: thickness ?? this.thickness,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
    );
  }

  @override
  ThemeExtension<TextFieldTheme> lerp(covariant ThemeExtension<TextFieldTheme>? other, double t) {
    if (other is! TextFieldTheme) {
      return this;
    }
    return TextFieldTheme(
      activeColor: Color.lerp(activeColor, other.activeColor, t)!,
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t)!,
      thickness: lerpDouble(thickness, other.thickness, t)!,
      thumbTheme: thumbTheme.lerp(other.thumbTheme, t),
    );
  }
}

@immutable
class ThumbTheme with ApiObject implements ThemeExtensionComposable<ThumbTheme> {
  final Color color;
  final double radius;

  const ThumbTheme({
    required this.color,
    required this.radius,
  });

  const ThumbTheme.common()
      : this(
          color: Colors.black,
          radius: 16.0,
        );

  ThumbTheme.fromJson(Map<String, dynamic> json)
      : color = Color(json['color']),
        radius = json['radius'];

  @override
  Map<String, dynamic> toJson() => {
        'color': color.value,
        'radius': radius,
      };

  @override
  ThumbTheme copyWith({
    Color? color,
    double? radius,
  }) {
    return ThumbTheme(color: color ?? this.color, radius: radius ?? this.radius);
  }

  @override
  ThumbTheme lerp(covariant ThumbTheme other, double t) {
    return ThumbTheme(
      color: Color.lerp(color, other.color, t)!,
      radius: lerpDouble(radius, other.radius, t)!,
    );
  }
}

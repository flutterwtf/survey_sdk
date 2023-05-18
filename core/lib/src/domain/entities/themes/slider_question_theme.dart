import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

const _thumbRadius = 16.0;
const _thickness = 8.0;
const _titleSize = 16.0;
const _subtitleSize = 12.0;
const _buttonTextSize = 12.0;
const _buttonRadius = 10.0;

// TODO(dev): Can we move equatable mixin to ApiObject?
/// The [SliderQuestionTheme] class represents the visual styling and appearance
/// for an slider question options.
///
/// This class extends the [ThemeExtension] class and implements the
/// [EquatableMixin] to provide equality checks and comparison methods.
class SliderQuestionTheme extends ThemeExtension<SliderQuestionTheme>
    with EquatableMixin {
  /// The color of the active portion of the slider.
  /// Default value is [Colors.black].
  final Color activeColor;

  /// The color of the inactive portion of the slider.
  /// Default value is [Color(FFCCCCCC)].
  final Color inactiveColor;

  /// The color of the slider thumb.
  /// Default value is [Colors.black].
  final Color thumbColor;

  /// The radius of the slider thumb.
  /// Default value is [16.0].
  final double thumbRadius;

  /// The thickness of the slider track.
  /// Default value is [8.0].
  final double thickness;

  /// Background color of the choice page.
  /// Default value is [Colors.white].
  final Color fill;

  /// Color of the title text.
  /// Default value is [Colors.black].
  final Color titleColor;

  /// Font size of the title text.
  /// Default value is [16.0].
  final double titleSize;

  /// Color of the subtitle text.
  /// Default value is [Colors.black].
  final Color subtitleColor;

  /// Font size of the subtitle text.
  /// Default value is [12.0].
  final double subtitleSize;

  /// Background color of the primary button.
  /// Default value is [Colors.black].
  final Color primaryButtonFill;

  /// Text color of the primary button.
  /// Default value is [Colors.white].
  final Color primaryButtonTextColor;

  /// Font size of the text displayed on the primary button.
  /// Default value is [12.0].
  final double primaryButtonTextSize;

  /// Border radius of the primary button.
  /// Default value is [10.0].
  final double primaryButtonRadius;

  /// Background color of the secondary button.
  /// Default value is [Colors.black].
  final Color secondaryButtonFill;

  /// Text color of the secondary button.
  /// Default value is [Colors.white].
  final Color secondaryButtonTextColor;

  /// Font size of the text displayed on the secondary button.
  /// Default value is [Colors.black].
  final double secondaryButtonTextSize;

  /// Border radius of the secondary button.
  /// Default value is [10.0].
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

  /// Creates a common instance of [SliderQuestionTheme].
  ///
  /// The [SliderQuestionTheme.common] constructor is a convenience constructor
  /// that creates a common instance of [SliderQuestionTheme] with predefined
  /// values.
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

  /// Linearly interpolates between two instances of [SliderQuestionTheme].
  ///
  /// The [lerp] method calculates the intermediate state between two instances
  /// of [SliderQuestionTheme] based on a given interpolation factor [t].
  ///
  /// If the `other` instance is not of type [SliderQuestionTheme], the method
  /// returns the current instance without any interpolation.
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

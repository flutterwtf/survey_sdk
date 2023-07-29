import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_sdk/src/presentation/utils/utils.dart';

/// The [EndQuestionTheme] class represents the visual styling and appearance
/// for an info question options.
///
/// This class extends the [ThemeExtension] class and implements the
/// [EquatableMixin] to provide equality checks and comparison methods.
class EndQuestionTheme extends ThemeExtension<EndQuestionTheme>
    with EquatableMixin {
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

  @override
  List<Object?> get props => [
    fill,
    titleColor,
    titleSize,
    subtitleColor,
    subtitleSize,
  ];

  const EndQuestionTheme({
    required this.fill,
    required this.titleColor,
    required this.titleSize,
    required this.subtitleColor,
    required this.subtitleSize,
  });

  /// Creates a common instance of [EndQuestionTheme].
  ///
  /// The [EndQuestionTheme.common] constructor is a convenience constructor
  /// that creates a common instance of [EndQuestionTheme] with predefined
  /// values.
  const EndQuestionTheme.common()
      : this(
    fill: SurveyColors.white,
    titleColor: SurveyColors.black,
    titleSize: SurveyFonts.sizeL,
    subtitleColor: SurveyColors.black,
    subtitleSize: SurveyFonts.sizeS,
  );

  @override
  EndQuestionTheme copyWith({
    Color? fill,
    Color? titleColor,
    double? titleSize,
    Color? subtitleColor,
    double? subtitleSize,
  }) {
    return EndQuestionTheme(
      fill: fill ?? this.fill,
      titleColor: titleColor ?? this.titleColor,
      titleSize: titleSize ?? this.titleSize,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      subtitleSize: subtitleSize ?? this.subtitleSize,
    );
  }

  /// Linearly interpolates between two instances of [EndQuestionTheme].
  ///
  /// The [lerp] method calculates the intermediate state between two instances
  /// of [EndQuestionTheme] based on a given interpolation factor [t].
  ///
  /// If the `other` instance is not of type [EndQuestionTheme], the method
  /// returns the current instance without any interpolation.
  @override
  EndQuestionTheme lerp(
      covariant EndQuestionTheme? other,
      double t,
      ) {
    if (other is! EndQuestionTheme) {
      return this;
    }
    return EndQuestionTheme(
      fill: Color.lerp(fill, other.fill, t)!,
      titleColor: Color.lerp(titleColor, other.titleColor, t)!,
      titleSize: lerpDouble(titleSize, other.titleSize, t)!,
      subtitleColor: Color.lerp(subtitleColor, other.subtitleColor, t)!,
      subtitleSize: lerpDouble(subtitleSize, other.subtitleSize, t)!,
    );
  }
}

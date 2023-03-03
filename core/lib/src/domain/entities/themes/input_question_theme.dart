import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';

class InputQuestionTheme extends ThemeExtension<InputQuestionTheme>
    with ApiObject {
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final Color hintColor;
  final double hintSize;
  final Color textColor;
  final double textSize;
  final int? minLines;
  final int? maxLines;
  final double? verticalPadding;
  final double? horizontalPadding;

  const InputQuestionTheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.borderWidth,
    required this.hintColor,
    required this.hintSize,
    required this.textColor,
    required this.textSize,
    this.minLines,
    this.maxLines,
    this.verticalPadding,
    this.horizontalPadding,
  });

  const InputQuestionTheme.common()
      : this(
          backgroundColor: Colors.white,
          borderColor: Colors.black,
          borderWidth: 1,
          hintColor: AppColors.textLightGrey,
          hintSize: AppFonts.sizeL,
          textColor: AppColors.black,
          textSize: AppFonts.sizeL,
        );

  @override
  ThemeExtension<InputQuestionTheme> copyWith({
    Color? backgroundColor,
    Color? borderColor,
    double? borderWidth,
    Color? hintColor,
    double? hintSize,
    Color? textColor,
    double? textSize,
    int? minLines,
    int? maxLines,
    double? verticalPadding,
    double? horizontalPadding,
    String? hintText,
  }) {
    return InputQuestionTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      hintColor: hintColor ?? this.hintColor,
      hintSize: hintSize ?? this.hintSize,
      textColor: textColor ?? this.textColor,
      textSize: textSize ?? this.textSize,
      minLines: minLines ?? this.minLines,
      maxLines: maxLines ?? this.maxLines,
      verticalPadding: verticalPadding ?? this.verticalPadding,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
    );
  }

  @override
  ThemeExtension<InputQuestionTheme> lerp(
    covariant ThemeExtension<InputQuestionTheme>? other,
    double t,
  ) {
    if (other is! InputQuestionTheme) {
      return this;
    }
    return InputQuestionTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t)!,
      hintColor: Color.lerp(hintColor, other.hintColor, t)!,
      hintSize: lerpDouble(hintSize, other.hintSize, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      textSize: lerpDouble(textSize, other.textSize, t)!,
      minLines: lerpDouble(minLines, other.minLines, t)?.toInt(),
      maxLines: lerpDouble(maxLines, other.maxLines, t)?.toInt(),
      verticalPadding: lerpDouble(verticalPadding, other.verticalPadding, t),
      horizontalPadding:
          lerpDouble(horizontalPadding, other.horizontalPadding, t),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO(dev): implement toJson
    throw UnimplementedError();
  }

  // TODO(dev): implement props
  List<Object?> get props => [
        backgroundColor,
        borderColor,
        borderWidth,
        hintColor,
        hintSize,
        textColor,
        textSize,
        minLines,
        maxLines,
        verticalPadding,
        horizontalPadding,
      ];
}

import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/themes/input_question_theme.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';

@immutable
class TextFieldThemeData extends ThemeExtension<TextFieldThemeData>
    with ApiObject, EquatableMixin {
  final Color fill;
  final Color borderColor;
  final double borderWidth;
  final double verticalPadding;
  final double horizontalPadding;
  final Color hintColor;
  final double hintSize;
  final Color textColor;
  final double textSize;
  final InputType inputType;

  const TextFieldThemeData({
    required this.fill,
    required this.borderColor,
    required this.borderWidth,
    required this.verticalPadding,
    required this.horizontalPadding,
    required this.hintColor,
    required this.hintSize,
    required this.textColor,
    required this.textSize,
    required this.inputType,
  });

  // TODO(dev): move commons to admin.
  const TextFieldThemeData.common()
      : this(
          fill: AppColors.white,
          borderColor: AppColors.black,
          borderWidth: AppDimensions.circularRadiusXS,
          verticalPadding: AppDimensions.marginM,
          horizontalPadding: AppDimensions.marginM,
          hintColor: AppColors.textGrey,
          hintSize: AppDimensions.marginM,
          textColor: AppColors.black,
          textSize: AppDimensions.marginM,
          inputType: InputType.text,
        );

  TextFieldThemeData.fromJson(Map<String, dynamic> json)
      : fill = Color(json['fill']),
        borderColor = Color(json['borderColor']),
        borderWidth = json['borderWidth'],
        verticalPadding = json['verticalPadding'],
        horizontalPadding = json['horizontalPadding'],
        hintColor = Color(json['hintColor']),
        hintSize = json['hintSize'],
        textColor = Color(json['textColor']),
        inputType = InputType.values[json['inputType']],
        textSize = json['textSize'];

  @override
  Map<String, dynamic> toJson() => {
        'fill': fill.value,
        'borderColor': borderColor.value,
        'borderWidth': borderWidth,
        'verticalPadding': verticalPadding,
        'horizontalPadding': horizontalPadding,
        'hintColor': hintColor.value,
        'hintSize': hintSize,
        'textColor': textColor.value,
        'textSize': textSize,
        'inputType': inputType.index,
      };

  @override
  ThemeExtension<TextFieldThemeData> copyWith({
    Color? fill,
    Color? borderColor,
    double? borderWidth,
    double? verticalPadding,
    double? horizontalPadding,
    Color? hintColor,
    double? hintSize,
    Color? textColor,
    double? textSize,
    InputType? inputType,
  }) {
    return TextFieldThemeData(
      fill: fill ?? this.fill,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      verticalPadding: verticalPadding ?? this.verticalPadding,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      hintColor: hintColor ?? this.hintColor,
      hintSize: hintSize ?? this.hintSize,
      textColor: textColor ?? this.textColor,
      textSize: textSize ?? this.textSize,
      inputType: inputType ?? this.inputType,
    );
  }

  @override
  TextFieldThemeData lerp(
    covariant TextFieldThemeData? other,
    double t,
  ) {
    if (other is! TextFieldThemeData) {
      return this;
    }
    return TextFieldThemeData(
      fill: Color.lerp(fill, other.fill, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t)!,
      verticalPadding: lerpDouble(verticalPadding, other.verticalPadding, t)!,
      horizontalPadding:
          lerpDouble(horizontalPadding, other.horizontalPadding, t)!,
      hintColor: Color.lerp(hintColor, other.hintColor, t)!,
      hintSize: lerpDouble(hintSize, other.hintSize, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      textSize: lerpDouble(textSize, other.textSize, t)!,
      inputType: inputType,
    );
  }

  @override
  List<Object?> get props => [
        fill,
        borderColor,
        borderWidth,
        verticalPadding,
        horizontalPadding,
        hintColor,
        hintSize,
        textColor,
        textSize,
    inputType,
      ];
}

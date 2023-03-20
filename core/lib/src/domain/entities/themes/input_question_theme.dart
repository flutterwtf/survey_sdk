import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';

class InputQuestionTheme extends ThemeExtension<InputQuestionTheme>
    with ApiObject, EquatableMixin {
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final Color hintColor;
  final double hintSize;
  final Color textColor;
  final double textSize;
  final int? lines;
  final double? verticalPadding;
  final double? horizontalPadding;
  final bool isMultiline;
  final String errorText;
  final InputType inputType;

  // TODO(dev): Add hint text.
  const InputQuestionTheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.borderWidth,
    required this.hintColor,
    required this.hintSize,
    required this.textColor,
    required this.textSize,
    required this.isMultiline,
    required this.errorText,
    required this.inputType,
    this.lines,
    this.verticalPadding,
    this.horizontalPadding,
  });

  InputQuestionTheme.fromJson(Map<String, dynamic> json)
      : backgroundColor = Color(json['backgroundColor']),
        borderColor = Color(json['borderColor']),
        borderWidth = json['borderWidth'],
        hintColor = Color(json['hintColor']),
        hintSize = json['hintSize'],
        textColor = Color(json['textColor']),
        textSize = json['textSize'],
        lines = json['lines'],
        verticalPadding = json['verticalPadding'],
        isMultiline = json['isMultiLine'],
        errorText = json['errorText'],
        inputType = json['inputType'],
        horizontalPadding = json['horizontalPadding'];

  @override
  Map<String, dynamic> toJson() => {
        'backgroundColor': backgroundColor.value,
        'borderColor': borderColor.value,
        'borderWidth': borderWidth,
        'hintColor': hintColor.value,
        'hintSize': hintSize,
        'textColor': textColor.value,
        'textSize': textSize,
        'lines': lines,
        'isMultiline': isMultiline,
        'errorText': errorText,
        'inputType': inputType,
        'verticalPadding': verticalPadding,
        'horizontalPadding': horizontalPadding,
      };

  const InputQuestionTheme.common()
      : this(
          backgroundColor: Colors.white,
          borderColor: Colors.black,
          borderWidth: 1,
          hintColor: AppColors.textLightGrey,
          hintSize: AppFonts.sizeL,
          textColor: AppColors.black,
          textSize: AppFonts.sizeL,
          inputType: InputType.text,
          // TODO(dev): Replace with the text.
          errorText: 'Error',
          isMultiline: false,
        );

  @override
  InputQuestionTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
    double? borderWidth,
    Color? hintColor,
    double? hintSize,
    Color? textColor,
    double? textSize,
    int? minLines,
    int? lines,
    double? verticalPadding,
    double? horizontalPadding,
    String? hintText,
    String? errorText,
    InputType? inputType,
    bool? isMultiline,
  }) {
    return InputQuestionTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      hintColor: hintColor ?? this.hintColor,
      hintSize: hintSize ?? this.hintSize,
      textColor: textColor ?? this.textColor,
      textSize: textSize ?? this.textSize,
      lines: lines ?? this.lines,
      verticalPadding: verticalPadding ?? this.verticalPadding,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      inputType: inputType ?? this.inputType,
      isMultiline: isMultiline ?? this.isMultiline,
      errorText: errorText ?? this.errorText,
    );
  }

  @override
  InputQuestionTheme lerp(
    covariant InputQuestionTheme? other,
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
      lines: lerpDouble(lines, other.lines, t)?.toInt(),
      verticalPadding: lerpDouble(verticalPadding, other.verticalPadding, t),
      horizontalPadding:
          lerpDouble(horizontalPadding, other.horizontalPadding, t),
      isMultiline: isMultiline,
      inputType: inputType,
      errorText: errorText,
    );
  }

  @override
  List<Object?> get props => [
        backgroundColor,
        borderColor,
        borderWidth,
        inputType,
        hintColor,
        hintSize,
        textColor,
        textSize,
        errorText,
        lines,
        verticalPadding,
        horizontalPadding,
        isMultiline,
      ];
}

enum InputType {
  text,
  number,
  date,
  email,
  password,
  phone;
}

import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/presentation/utils/app_colors.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';

const _titleSize = 16.0;
const _subtitleSize = 12.0;
const _buttonTextSize = 12.0;
const _buttonRadius = 10.0;
const _horizontalPadding = 14.0;
const _verticalPadding = 14.0;

/// Defines the visual properties for an input question options
class InputQuestionTheme extends ThemeExtension<InputQuestionTheme>
    with ApiObject, EquatableMixin {
  /// Background color of the text field. Common value is [Colors.white]
  final Color inputFill;

  /// Color of the border around the text field.
  /// Common value is [Colors.black]
  final Color borderColor;

  /// Width of the border around the text field. Common value is 1
  final double borderWidth;

  /// Color of the hint text that is displayed when the text field is empty.
  /// Common value is [AppColors.textLightGrey]
  final Color hintColor;

  /// Font size of the hint text. Common value is 16
  final double hintSize;

  /// Color of the text that is entered into the text field.
  /// Common value is [Colors.black]
  final Color textColor;

  /// Font size of the text that is entered into the text field.
  /// Common value is 16
  final double textSize;

  /// Number of lines that the text field can display
  final int lines;

  final double verticalPadding;

  /// Padding added to the left and right of the text field
  final double horizontalPadding;
  final bool isMultiline;
  final String errorText;
  final InputType inputType;
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
        inputFill,
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
  const InputQuestionTheme({
    required this.inputFill,
    required this.borderColor,
    required this.borderWidth,
    required this.hintColor,
    required this.hintSize,
    required this.textColor,
    required this.textSize,
    required this.isMultiline,
    required this.errorText,
    required this.inputType,
    required this.fill,
    required this.titleColor,
    required this.titleSize,
    required this.subtitleColor,
    required this.subtitleSize,
    required this.buttonFill,
    required this.buttonTextColor,
    required this.buttonTextSize,
    required this.buttonRadius,
    required this.lines,
    required this.verticalPadding,
    required this.horizontalPadding,
  });

  InputQuestionTheme.fromJson(Map<String, dynamic> json)
      : inputFill = Color(json['inputFill']),
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
        horizontalPadding = json['horizontalPadding'],
        fill = json['fill'],
        titleColor = json['titleColor'],
        titleSize = json['titleSize'],
        subtitleColor = json['subtitleColor'],
        subtitleSize = json['subtitleSize'],
        buttonFill = json['buttonFill'],
        buttonTextColor = json['buttonTextColor'],
        buttonTextSize = json['buttonTextSize'],
        buttonRadius = json['buttonRadius'];

  /// Default color and size values of input question page
  const InputQuestionTheme.common()
      : this(
          inputFill: Colors.white,
          borderColor: Colors.black,
          borderWidth: 1,
          lines: 1,
          hintColor: AppColors.textLightGrey,
          hintSize: AppFonts.sizeL,
          textColor: AppColors.black,
          textSize: AppFonts.sizeL,
          inputType: InputType.text,
          // TODO(dev): Replace with the text.
          errorText: 'Error',
          isMultiline: false,
          fill: Colors.white,
          titleColor: Colors.black,
          titleSize: _titleSize,
          subtitleColor: Colors.black,
          subtitleSize: _subtitleSize,
          buttonFill: Colors.black,
          buttonTextColor: Colors.white,
          buttonTextSize: _buttonTextSize,
          buttonRadius: _buttonRadius,
          horizontalPadding: _horizontalPadding,
          verticalPadding: _verticalPadding,
        );

  @override
  Map<String, dynamic> toJson() => {
        'inputFill': inputFill.value,
        'borderColor': borderColor.value,
        'borderWidth': borderWidth,
        'hintColor': hintColor.value,
        'hintSize': hintSize,
        'textColor': textColor.value,
        'textSize': textSize,
        'lines': lines,
        'isMultiline': isMultiline,
        'errorText': errorText,
        'inputType': inputType.index,
        'verticalPadding': verticalPadding,
        'horizontalPadding': horizontalPadding,
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
  InputQuestionTheme copyWith({
    Color? inputFill,
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
    return InputQuestionTheme(
      inputFill: inputFill ?? this.inputFill,
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
  InputQuestionTheme lerp(
    covariant InputQuestionTheme? other,
    double t,
  ) {
    if (other is! InputQuestionTheme) {
      return this;
    }
    return InputQuestionTheme(
      inputFill: Color.lerp(inputFill, other.inputFill, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t)!,
      hintColor: Color.lerp(hintColor, other.hintColor, t)!,
      hintSize: lerpDouble(hintSize, other.hintSize, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      textSize: lerpDouble(textSize, other.textSize, t)!,
      lines: lines,
      verticalPadding: lerpDouble(verticalPadding, other.verticalPadding, t)!,
      horizontalPadding:
          lerpDouble(horizontalPadding, other.horizontalPadding, t)!,
      isMultiline: isMultiline,
      inputType: inputType,
      errorText: errorText,
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

enum InputType {
  text,
  number,
  date,
  email,
  password,
  phone;
}

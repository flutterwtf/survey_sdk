import 'package:flutter/material.dart';
import 'package:survey_sdk/survey_sdk.dart';

extension InputQuestionThemeMapper on InputQuestionTheme {
  static InputQuestionTheme fromJson(Map<String, dynamic> json) {
    return InputQuestionTheme(
      inputFill: Color(json['inputFill']),
      borderColor: Color(json['borderColor']),
      borderWidth: json['borderWidth'],
      hintColor: Color(json['hintColor']),
      hintSize: json['hintSize'],
      textColor: Color(json['textColor']),
      textSize: json['textSize'],
      lines: json['lines'],
      verticalPadding: json['verticalPadding'],
      isMultiline: json['isMultiLine'] == 1,
      errorText: json['errorText'],
      inputType: InputType.fromJson(json['inputType']),
      horizontalPadding: json['horizontalPadding'],
      fill: Color(json['fill']),
      titleColor: Color(json['titleColor']),
      titleSize: json['titleSize'],
      subtitleColor: Color(json['subtitleColor']),
      subtitleSize: json['subtitleSize'],
      primaryButtonFill: Color(json['primaryButtonFill']),
      primaryButtonTextColor: Color(json['primaryButtonTextColor']),
      primaryButtonTextSize: json['primaryButtonTextSize'],
      primaryButtonRadius: json['primaryButtonRadius'],
      secondaryButtonFill: Color(json['secondaryButtonFill']),
      secondaryButtonTextColor: Color(json['secondaryButtonTextColor']),
      secondaryButtonTextSize: json['secondaryButtonTextSize'],
      secondaryButtonRadius: json['secondaryButtonRadius'],
    );
  }

  Map<String, dynamic> toJson() => {
        'inputFill': inputFill.value,
        'borderColor': borderColor.value,
        'borderWidth': borderWidth,
        'hintColor': hintColor.value,
        'hintSize': hintSize,
        'textColor': textColor.value,
        'textSize': textSize,
        'lines': lines,
        'isMultiline': isMultiline ? 1 : 0,
        'errorText': errorText,
        'inputType': inputType.toJson(),
        'verticalPadding': verticalPadding,
        'horizontalPadding': horizontalPadding,
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
}

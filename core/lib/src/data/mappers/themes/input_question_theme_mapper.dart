import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/themes/question_theme_mapper.dart';
import 'package:survey_sdk/survey_sdk.dart';

class InputQuestionThemeMapper extends QuestionThemeMapper<InputQuestionTheme> {
  @override
  InputQuestionTheme fromJson(Map<String, dynamic> json) {
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

  @override
  Map<String, dynamic> toJson(InputQuestionTheme theme) {
    return {
      'inputFill': theme.inputFill.value,
      'borderColor': theme.borderColor.value,
      'borderWidth': theme.borderWidth,
      'hintColor': theme.hintColor.value,
      'hintSize': theme.hintSize,
      'textColor': theme.textColor.value,
      'textSize': theme.textSize,
      'lines': theme.lines,
      'isMultiline': theme.isMultiline ? 1 : 0,
      'errorText': theme.errorText,
      'inputType': theme.inputType.toJson(),
      'verticalPadding': theme.verticalPadding,
      'horizontalPadding': theme.horizontalPadding,
      'fill': theme.fill.value,
      'titleColor': theme.titleColor.value,
      'titleSize': theme.titleSize,
      'subtitleColor': theme.subtitleColor.value,
      'subtitleSize': theme.subtitleSize,
      'primaryButtonFill': theme.primaryButtonFill.value,
      'primaryButtonTextColor': theme.primaryButtonTextColor.value,
      'primaryButtonTextSize': theme.primaryButtonTextSize,
      'primaryButtonRadius': theme.primaryButtonRadius,
      'secondaryButtonFill': theme.secondaryButtonFill.value,
      'secondaryButtonTextColor': theme.secondaryButtonTextColor.value,
      'secondaryButtonTextSize': theme.secondaryButtonTextSize,
      'secondaryButtonRadius': theme.secondaryButtonRadius,
    };
  }
}

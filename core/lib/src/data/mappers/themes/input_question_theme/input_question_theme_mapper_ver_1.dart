import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/themes/json_version/question_theme_mapper_json_1.dart';
import 'package:survey_sdk/src/domain/entities/themes/input_question_theme.dart';

abstract class _Fields {
  static const String inputFill = 'inputFill';
  static const String borderColor = 'borderColor';
  static const String borderWidth = 'borderWidth';
  static const String hintColor = 'hintColor';
  static const String hintSize = 'hintSize';
  static const String textColor = 'textColor';
  static const String textSize = 'textSize';
  static const String lines = 'lines';
  static const String verticalPadding = 'verticalPadding';
  static const String isMultiLine = 'isMultiLine';
  static const String errorText = 'errorText';
  static const String inputType = 'inputType';
  static const String horizontalPadding = 'horizontalPadding';
  static const String fill = 'fill';
  static const String titleColor = 'titleColor';
  static const String titleSize = 'titleSize';
  static const String subtitleColor = 'subtitleColor';
  static const String subtitleSize = 'subtitleSize';
  static const String primaryButtonFill = 'primaryButtonFill';
  static const String primaryButtonTextColor = 'primaryButtonTextColor';
  static const String primaryButtonTextSize = 'primaryButtonTextSize';
  static const String primaryButtonRadius = 'primaryButtonRadius';
  static const String secondaryButtonFill = 'secondaryButtonFill';
  static const String secondaryButtonTextColor = 'secondaryButtonTextColor';
  static const String secondaryButtonTextSize = 'secondaryButtonTextSize';
  static const String secondaryButtonRadius = 'secondaryButtonRadius';
  static const String isMultiline = 'isMultiline';
}

class InputQuestionThemeMapperVer1
    extends QuestionThemeMapperJson1<InputQuestionTheme> {
  @override
  InputQuestionTheme fromJson(Map<String, dynamic> json) {
    return InputQuestionTheme(
      inputFill: Color(json[_Fields.inputFill]),
      borderColor: Color(json[_Fields.borderColor]),
      borderWidth: json[_Fields.borderWidth],
      hintColor: Color(json[_Fields.hintColor]),
      hintSize: json[_Fields.hintSize],
      textColor: Color(json[_Fields.textColor]),
      textSize: json[_Fields.textSize],
      lines: json[_Fields.lines],
      verticalPadding: json[_Fields.verticalPadding],
      isMultiline: json[_Fields.isMultiLine] == 1,
      errorText: json[_Fields.errorText],
      inputType: InputType.fromJson(json[_Fields.inputType]),
      horizontalPadding: json[_Fields.horizontalPadding],
      fill: Color(json[_Fields.fill]),
      titleColor: Color(json[_Fields.titleColor]),
      titleSize: json[_Fields.titleSize],
      subtitleColor: Color(json[_Fields.subtitleColor]),
      subtitleSize: json[_Fields.subtitleSize],
      primaryButtonFill: Color(json[_Fields.primaryButtonFill]),
      primaryButtonTextColor: Color(json[_Fields.primaryButtonTextColor]),
      primaryButtonTextSize: json[_Fields.primaryButtonTextSize],
      primaryButtonRadius: json[_Fields.primaryButtonRadius],
      secondaryButtonFill: Color(json[_Fields.secondaryButtonFill]),
      secondaryButtonTextColor: Color(json[_Fields.secondaryButtonTextColor]),
      secondaryButtonTextSize: json[_Fields.secondaryButtonTextSize],
      secondaryButtonRadius: json[_Fields.secondaryButtonRadius],
    );
  }

  @override
  Map<String, dynamic> toJson(InputQuestionTheme theme) {
    return {
      _Fields.inputFill: theme.inputFill.value,
      _Fields.borderColor: theme.borderColor.value,
      _Fields.borderWidth: theme.borderWidth,
      _Fields.hintColor: theme.hintColor.value,
      _Fields.hintSize: theme.hintSize,
      _Fields.textColor: theme.textColor.value,
      _Fields.textSize: theme.textSize,
      _Fields.lines: theme.lines,
      _Fields.isMultiline: theme.isMultiline ? 1 : 0,
      _Fields.errorText: theme.errorText,
      _Fields.inputType: theme.inputType.toJson(),
      _Fields.verticalPadding: theme.verticalPadding,
      _Fields.horizontalPadding: theme.horizontalPadding,
      _Fields.fill: theme.fill.value,
      _Fields.titleColor: theme.titleColor.value,
      _Fields.titleSize: theme.titleSize,
      _Fields.subtitleColor: theme.subtitleColor.value,
      _Fields.subtitleSize: theme.subtitleSize,
      _Fields.primaryButtonFill: theme.primaryButtonFill.value,
      _Fields.primaryButtonTextColor: theme.primaryButtonTextColor.value,
      _Fields.primaryButtonTextSize: theme.primaryButtonTextSize,
      _Fields.primaryButtonRadius: theme.primaryButtonRadius,
      _Fields.secondaryButtonFill: theme.secondaryButtonFill.value,
      _Fields.secondaryButtonTextColor: theme.secondaryButtonTextColor.value,
      _Fields.secondaryButtonTextSize: theme.secondaryButtonTextSize,
      _Fields.secondaryButtonRadius: theme.secondaryButtonRadius,
    };
  }
}

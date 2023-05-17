import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/themes/question_theme_mapper.dart';
import 'package:survey_sdk/survey_sdk.dart';

abstract class _Fields {
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
}

class IntroQuestionThemeMapper extends QuestionThemeMapper<IntroQuestionTheme> {
  @override
  IntroQuestionTheme fromJson(Map<String, dynamic> json) {
    return IntroQuestionTheme(
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
  Map<String, dynamic> toJson(IntroQuestionTheme theme) {
    return {
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

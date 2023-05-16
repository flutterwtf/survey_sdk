import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/themes/question_theme_mapper.dart';
import 'package:survey_sdk/survey_sdk.dart';

class IntroQuestionThemeMapper extends QuestionThemeMapper<IntroQuestionTheme> {
  @override
  IntroQuestionTheme fromJson(Map<String, dynamic> json) {
    return IntroQuestionTheme(
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
  Map<String, dynamic> toJson(IntroQuestionTheme theme) {
    return {
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

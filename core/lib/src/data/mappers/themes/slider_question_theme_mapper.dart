import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/themes/question_theme_mapper.dart';
import 'package:survey_sdk/src/domain/entities/themes/slider_question_theme.dart';

class SliderQuestionThemeMapper
    extends QuestionThemeMapper<SliderQuestionTheme> {
  @override
  SliderQuestionTheme fromJson(Map<String, dynamic> json) {
    return SliderQuestionTheme(
      activeColor: Color(json['activeColor']),
      inactiveColor: Color(json['inactiveColor']),
      thumbColor: Color(json['thumbColor']),
      thumbRadius: json['thumbRadius'],
      thickness: json['thickness'],
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
  Map<String, dynamic> toJson(SliderQuestionTheme theme) {
    return {
      'activeColor': theme.activeColor.value,
      'inactiveColor': theme.inactiveColor.value,
      'thumbColor': theme.thumbColor.value,
      'thumbRadius': theme.thumbRadius,
      'thickness': theme.thickness,
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

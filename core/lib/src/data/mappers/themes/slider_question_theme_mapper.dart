import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/themes/slider_question_theme.dart';

extension SliderQuestionThemeMapper on SliderQuestionTheme {
  static SliderQuestionTheme fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() => {
        'activeColor': activeColor.value,
        'inactiveColor': inactiveColor.value,
        'thumbColor': thumbColor.value,
        'thumbRadius': thumbRadius,
        'thickness': thickness,
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

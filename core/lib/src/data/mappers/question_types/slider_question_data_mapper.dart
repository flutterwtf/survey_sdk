import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/question_types/question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/themes/slider_question_theme_mapper.dart';
import 'package:survey_sdk/survey_sdk.dart';

class SliderQuestionDataMapper extends QuestionDataMapper<SliderQuestionData> {
  @override
  SliderQuestionData fromJson(Map<String, dynamic> json) {
    final theme = json['theme'];
    return SliderQuestionData(
      index: json['index'],
      minValue: json['minValue'],
      maxValue: json['maxValue'],
      divisions: json['divisions'],
      initialValue: json['initialValue'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      theme: theme != null
          ? SliderQuestionThemeMapper().fromJson(theme)
          : const SliderQuestionTheme.common(),
      secondaryButtonText: json['secondaryButtonText'],
      primaryButtonText: json['primaryButtonText'],
    );
  }

  @override
  Map<String, dynamic> toJson(
    SliderQuestionData data, {
    ThemeExtension<dynamic>? commonTheme,
  }) {
    late final SliderQuestionTheme? theme;
    //ignore: prefer-conditional-expressions
    if (commonTheme != null) {
      theme = commonTheme == data.theme ? null : data.theme;
    } else {
      theme = data.theme;
    }
    return {
      'index': data.index,
      'theme': theme != null
          ? SliderQuestionThemeMapper().toJson(theme)
          : SliderQuestionThemeMapper()
              .toJson(const SliderQuestionTheme.common()),
      'minValue': data.minValue,
      'maxValue': data.maxValue,
      'divisions': data.divisions,
      'initialValue': data.initialValue,
      'title': data.title,
      'subtitle': data.subtitle,
      'type': data.type,
      'isSkip': data.isSkip,
      'content': data.content,
      'secondaryButtonText': data.secondaryButtonText,
      'primaryButtonText': data.primaryButtonText,
    };
  }
}

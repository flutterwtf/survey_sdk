import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/question_types/question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/themes/intro_question_theme_mapper.dart';
import 'package:survey_sdk/survey_sdk.dart';

class IntroQuestionDataMapper extends QuestionDataMapper<IntroQuestionData> {
  @override
  IntroQuestionData fromJson(Map<String, dynamic> json) {
    final theme = json['theme'];
    return IntroQuestionData(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      theme: theme != null
          ? IntroQuestionThemeMapper().fromJson(theme)
          : const IntroQuestionTheme.common(),
      secondaryButtonText: json['secondaryButtonText'],
      primaryButtonText: json['primaryButtonText'],
    );
  }

  @override
  Map<String, dynamic> toJson(
    IntroQuestionData data, {
    ThemeExtension<dynamic>? commonTheme,
  }) {
    late final IntroQuestionTheme? theme;
    //ignore: prefer-conditional-expressions
    if (commonTheme != null) {
      theme = commonTheme == data.theme ? null : data.theme;
    } else {
      theme = data.theme;
    }
    return {
      'index': data.index,
      'title': data.title,
      'subtitle': data.subtitle,
      'type': data.type,
      'isSkip': data.isSkip,
      'content': data.content,
      'theme': theme != null
          ? IntroQuestionThemeMapper().toJson(theme)
          : IntroQuestionThemeMapper()
              .toJson(const IntroQuestionTheme.common()),
      'secondaryButtonText': data.secondaryButtonText,
      'primaryButtonText': data.primaryButtonText,
    };
  }
}

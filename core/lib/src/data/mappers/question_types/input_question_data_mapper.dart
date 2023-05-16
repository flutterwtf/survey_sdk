import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/question_types/question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/themes/input_question_theme_mapper.dart';
import 'package:survey_sdk/survey_sdk.dart';

class InputQuestionDataMapper extends QuestionDataMapper<InputQuestionData> {
  @override
  InputQuestionData fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> payload = json['payload'];
    final theme = json['theme'];
    return InputQuestionData(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      validator: InputValidator.fromJson(payload),
      hintText: payload['hintText'],
      secondaryButtonText: json['secondaryButtonText'],
      primaryButtonText: json['primaryButtonText'],
      theme: theme != null
          ? InputQuestionThemeMapper().fromJson(theme)
          : const InputQuestionTheme.common(),
    );
  }

  @override
  Map<String, dynamic> toJson(
    InputQuestionData data, {
    ThemeExtension<dynamic>? commonTheme,
  }) {
    late final InputQuestionTheme? theme;
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
          ? InputQuestionThemeMapper().toJson(theme)
          : InputQuestionThemeMapper()
              .toJson(const InputQuestionTheme.common()),
      'payload': {
        ...data.validator.toJson(),
        'hintText': data.hintText,
      },
      'secondaryButtonText': data.secondaryButtonText,
      'primaryButtonText': data.primaryButtonText,
    };
  }
}

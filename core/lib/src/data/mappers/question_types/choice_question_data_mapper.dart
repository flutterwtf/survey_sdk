import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/question_types/question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/themes/choice_question_theme_mapper.dart';
import 'package:survey_sdk/survey_sdk.dart';

class ChoiceQuestionDataMapper extends QuestionDataMapper<ChoiceQuestionData> {
  @override
  ChoiceQuestionData fromJson(Map<String, dynamic> json) {
    final payload = json['payload'] as Map<String, dynamic>;
    final theme = json['theme'];
    return ChoiceQuestionData(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      isMultipleChoice: payload['isMultipleChoice'],
      options: (payload['options'] as List<dynamic>).cast<String>(),
      selectedOptions: payload['selectedOptions'] != null
          ? (payload['selectedOptions'] as List<dynamic>).cast<int>()
          : null,
      ruleType: RuleType.values[payload['ruleType']],
      ruleValue: payload['ruleValue'],
      theme: theme != null
          ? ChoiceQuestionThemeMapper().fromJson(theme)
          : const ChoiceQuestionTheme.common(),
      primaryButtonText: json['primaryButtonText'],
      secondaryButtonText: json['secondaryButtonText'],
    );
  }

  @override
  Map<String, dynamic> toJson(
    ChoiceQuestionData data, {
    ThemeExtension<dynamic>? commonTheme,
  }) {
    late final ChoiceQuestionTheme? theme;
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
          ? ChoiceQuestionThemeMapper().toJson(theme)
          : ChoiceQuestionThemeMapper()
              .toJson(const ChoiceQuestionTheme.common()),
      // TODO(dev): Do we need payload?
      // TODO(dev): Should we move keys to const?
      'payload': {
        'isMultipleChoice': data.isMultipleChoice,
        'options': data.options,
        'selectedOptions': data.selectedOptions,
        'ruleType': data.ruleType.index,
        'ruleValue': data.ruleValue,
      },
      'secondaryButtonText': data.secondaryButtonText,
      'primaryButtonText': data.primaryButtonText,
    };
  }
}

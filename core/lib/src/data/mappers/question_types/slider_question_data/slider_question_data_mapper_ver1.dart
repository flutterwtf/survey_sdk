import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/question_types/json_version/question_data_mapper_json_1.dart';
import 'package:survey_sdk/src/data/mappers/themes/slider_question_theme/slider_question_theme_mapper_ver_1.dart';
import 'package:survey_sdk/survey_sdk.dart';

abstract class _Fields {
  static const String index = 'index';
  static const String title = 'title';
  static const String subtitle = 'subtitle';
  static const String isSkip = 'isSkip';
  static const String content = 'content';
  static const String primaryButtonText = 'primaryButtonText';
  static const String secondaryButtonText = 'secondaryButtonText';
  static const String theme = 'theme';
  static const String minValue = 'minValue';
  static const String maxValue = 'maxValue';
  static const String divisions = 'divisions';
  static const String initialValue = 'initialValue';
  static const String type = 'type';
  static const String actions = 'actions';
  static const String mainButtonAction = 'mainButtonAction';
  static const String secondaryButtonAction = 'secondaryButtonAction';
}

class SliderQuestionDataMapperVer1
    extends QuestionDataMapperJson1<SliderQuestionData> {
  @override
  SliderQuestionData fromJson(Map<String, dynamic> json) {
    final theme = json[_Fields.theme];
    final actions = json[_Fields.actions] as Map<String, dynamic>;

    return SliderQuestionData(
      index: json[_Fields.index],
      minValue: json[_Fields.minValue],
      maxValue: json[_Fields.maxValue],
      divisions: json[_Fields.divisions],
      initialValue: json[_Fields.initialValue],
      title: json[_Fields.title],
      subtitle: json[_Fields.subtitle],
      isSkip: json[_Fields.isSkip],
      content: json[_Fields.content],
      theme: theme != null
          ? SliderQuestionThemeMapperVer1().fromJson(theme)
          : const SliderQuestionTheme.common(),
      secondaryButtonText: json[_Fields.secondaryButtonText],
      primaryButtonText: json[_Fields.primaryButtonText],
      mainButtonAction: SurveyAction.fromType(
        actions[_Fields.mainButtonAction],
      ),
      secondaryButtonAction: SurveyAction.fromType(
        actions[_Fields.secondaryButtonAction],
      ),
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
      _Fields.index: data.index,
      _Fields.theme: theme != null
          ? SliderQuestionThemeMapperVer1().toJson(theme)
          : SliderQuestionThemeMapperVer1()
              .toJson(const SliderQuestionTheme.common()),
      _Fields.minValue: data.minValue,
      _Fields.maxValue: data.maxValue,
      _Fields.divisions: data.divisions,
      _Fields.initialValue: data.initialValue,
      _Fields.title: data.title,
      _Fields.subtitle: data.subtitle,
      _Fields.type: data.type,
      _Fields.isSkip: data.isSkip,
      _Fields.content: data.content,
      _Fields.secondaryButtonText: data.secondaryButtonText,
      _Fields.primaryButtonText: data.primaryButtonText,
      _Fields.actions: {
        _Fields.mainButtonAction: data.mainButtonAction == null
            ? null
            : SurveyAction.toJsonByType(data.mainButtonAction!),
        _Fields.secondaryButtonAction: data.secondaryButtonAction == null
            ? null
            : SurveyAction.toJsonByType(data.secondaryButtonAction!),
      },
    };
  }
}

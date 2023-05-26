import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/question_types/mapper_version/question_data_mapper_ver_1.dart';
import 'package:survey_sdk/src/data/mappers/question_types/question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/themes/slider_question_theme_mapper.dart';
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
}

abstract class SliderQuestionDataMapperFactory {
  static QuestionDataMapper getMapper(int version) {
    switch (version) {
      case 1:
        return SliderQuestionDataMapperVer1();
      default:
        throw UnimplementedError();
    }
  }
}

class SliderQuestionDataMapperVer1
    extends QuestionDataMapperVer1<SliderQuestionData> {
  @override
  SliderQuestionData fromJson(Map<String, dynamic> json) {
    final theme = json[_Fields.theme];
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
          ? SliderQuestionThemeMapper().fromJson(theme)
          : const SliderQuestionTheme.common(),
      secondaryButtonText: json[_Fields.secondaryButtonText],
      primaryButtonText: json[_Fields.primaryButtonText],
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
          ? SliderQuestionThemeMapper().toJson(theme)
          : SliderQuestionThemeMapper()
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
    };
  }
}

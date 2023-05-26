import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/question_types/mapper_version/question_data_mapper_ver_1.dart';
import 'package:survey_sdk/src/data/mappers/question_types/question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/themes/intro_question_theme_mapper.dart';
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
  static const String type = 'type';
}

abstract class IntroQuestionDataMapperFactory {
  static QuestionDataMapper getMapper(int version) {
    switch (version) {
      case 1:
        return IntroQuestionDataMapperVer1();
      default:
        throw UnimplementedError();
    }
  }
}

class IntroQuestionDataMapperVer1
    extends QuestionDataMapperVer1<IntroQuestionData> {
  @override
  IntroQuestionData fromJson(Map<String, dynamic> json) {
    final theme = json[_Fields.theme];
    return IntroQuestionData(
      index: json[_Fields.index],
      title: json[_Fields.title],
      subtitle: json[_Fields.subtitle],
      isSkip: json[_Fields.isSkip],
      content: json[_Fields.content],
      theme: theme != null
          ? IntroQuestionThemeMapper().fromJson(theme)
          : const IntroQuestionTheme.common(),
      secondaryButtonText: json[_Fields.secondaryButtonText],
      primaryButtonText: json[_Fields.primaryButtonText],
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
      _Fields.index: data.index,
      _Fields.title: data.title,
      _Fields.subtitle: data.subtitle,
      _Fields.type: data.type,
      _Fields.isSkip: data.isSkip,
      _Fields.content: data.content,
      _Fields.theme: theme != null
          ? IntroQuestionThemeMapper().toJson(theme)
          : IntroQuestionThemeMapper()
              .toJson(const IntroQuestionTheme.common()),
      _Fields.secondaryButtonText: data.secondaryButtonText,
      _Fields.primaryButtonText: data.primaryButtonText,
    };
  }
}

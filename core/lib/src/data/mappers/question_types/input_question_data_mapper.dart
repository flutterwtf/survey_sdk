import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/question_types/mapper_version/question_data_mapper_ver_1.dart';
import 'package:survey_sdk/src/data/mappers/question_types/question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/themes/input_question_theme_mapper.dart';
import 'package:survey_sdk/survey_sdk.dart';

abstract class _Fields {
  static const String index = 'index';
  static const String title = 'title';
  static const String subtitle = 'subtitle';
  static const String isSkip = 'isSkip';
  static const String content = 'content';
  static const String hintText = 'isMultipleChoice';
  static const String primaryButtonText = 'primaryButtonText';
  static const String secondaryButtonText = 'secondaryButtonText';
  static const String payload = 'payload';
  static const String theme = 'theme';
  static const String type = 'type';
}

abstract class InputQuestionDataMapperFactory {
  static QuestionDataMapper getMapper(int version) {
    switch (version) {
      case 1:
        return InputQuestionDataMapperVer1();
      default:
        throw UnimplementedError();
    }
  }
}

class InputQuestionDataMapperVer1
    extends QuestionDataMapperVer1<InputQuestionData> {
  @override
  InputQuestionData fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> payload = json[_Fields.payload];
    final theme = json[_Fields.theme];
    return InputQuestionData(
      index: json[_Fields.index],
      title: json[_Fields.title],
      subtitle: json[_Fields.subtitle],
      isSkip: json[_Fields.isSkip],
      content: json[_Fields.content],
      validator: InputValidator.fromJson(payload),
      hintText: payload[_Fields.hintText],
      secondaryButtonText: json[_Fields.secondaryButtonText],
      primaryButtonText: json[_Fields.primaryButtonText],
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
      _Fields.index: data.index,
      _Fields.title: data.title,
      _Fields.subtitle: data.subtitle,
      _Fields.type: data.type,
      _Fields.isSkip: data.isSkip,
      _Fields.content: data.content,
      _Fields.theme: theme != null
          ? InputQuestionThemeMapper().toJson(theme)
          : InputQuestionThemeMapper()
              .toJson(const InputQuestionTheme.common()),
      _Fields.payload: {
        ...data.validator.toJson(),
        _Fields.hintText: data.hintText,
      },
      _Fields.secondaryButtonText: data.secondaryButtonText,
      _Fields.primaryButtonText: data.primaryButtonText,
    };
  }
}

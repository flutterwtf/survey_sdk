import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/themes/json_version/question_theme_mapper_json_1.dart';
import 'package:survey_sdk/src/domain/entities/themes/end_question_theme.dart';

abstract class _Fields {
  static const String fill = 'fill';
  static const String titleColor = 'titleColor';
  static const String titleSize = 'titleSize';
  static const String subtitleColor = 'subtitleColor';
  static const String subtitleSize = 'subtitleSize';
}

class EndQuestionThemeMapperVer1
    extends QuestionThemeMapperJson1<EndQuestionTheme> {
  @override
  EndQuestionTheme fromJson(Map<String, dynamic> json) {
    return EndQuestionTheme(
      fill: Color(json[_Fields.fill]),
      titleColor: Color(json[_Fields.titleColor]),
      titleSize: (json[_Fields.titleSize] as num).toDouble(),
      subtitleColor: Color(json[_Fields.subtitleColor]),
      subtitleSize: (json[_Fields.subtitleSize] as num).toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson(EndQuestionTheme theme) {
    return {
      _Fields.fill: theme.fill.value,
      _Fields.titleColor: theme.titleColor.value,
      _Fields.titleSize: theme.titleSize,
      _Fields.subtitleColor: theme.subtitleColor.value,
      _Fields.subtitleSize: theme.subtitleSize,
    };
  }
}

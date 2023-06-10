import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/question_types/choice_question_data/choice_question_data_mapper_factory.dart';
import 'package:survey_sdk/src/data/mappers/question_types/info_question_data/info_question_data_mapper_factory.dart';
import 'package:survey_sdk/src/data/mappers/question_types/input_question_data/input_question_data_mapper_factory.dart';
import 'package:survey_sdk/src/data/mappers/question_types/slider_question_data/slider_question_data_mapper_factory.dart';
import 'package:survey_sdk/src/domain/entities/api_object.dart';
import 'package:survey_sdk/src/domain/entities/constants/scheme_info.dart';
import 'package:survey_sdk/survey_sdk.dart';

abstract class _Fields {
  static const String questions = 'questions';
  static const String endPage = 'endPage';
  static const String commonTheme = 'commonTheme';
  static const String schemeVersion = 'schemeVersion';
}

/// Holds the core survey data used in the whole app, including the list of
/// questions and the common theme.
class SurveyData with EquatableMixin, ApiObject {
  /// List of questions used to build question pages of different types
  /// of questions.
  final List<QuestionData> questions;

  /// Contains last page in the survey.
  final InfoQuestionData endPage;

  /// Defines the visual properties used throughout the app.
  final CommonTheme commonTheme;

  @override
  List<Object?> get props => [
        ...questions,
        commonTheme,
      ];

  SurveyData({
    required this.questions,
    required this.endPage,
    required this.commonTheme,
  });

  factory SurveyData.fromJson(Map<String, dynamic> json) {
    final questions = <QuestionData>[];
    final schemeVersion = json[_Fields.schemeVersion];
    final endPage =
        QuestionData.fromType(json[_Fields.endPage], schemeVersion)
            as InfoQuestionData;
    for (final questionJson in json[_Fields.questions]) {
      questions.add(QuestionData.fromType(questionJson, schemeVersion));
    }
    return SurveyData(
      questions: questions,
      endPage: endPage,
      commonTheme: CommonTheme.fromJson(
        json[_Fields.commonTheme],
        schemeVersion,
      ),
    );
  }

  SurveyData copyWith({
    List<QuestionData>? questions,
    InfoQuestionData? endPage,
    CommonTheme? commonTheme,
  }) {
    return SurveyData(
      questions: questions ?? this.questions,
      endPage: endPage ?? this.endPage,
      commonTheme: commonTheme ?? this.commonTheme,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    const schemeVersion = SchemeInfo.version;
    return {
      _Fields.schemeVersion: schemeVersion,
      _Fields.endPage: _toJson(
        _themeFromQuestionType(endPage.type),
        endPage,
        schemeVersion,
      ),
      _Fields.commonTheme: commonTheme.toJson(
        schemeVersion: schemeVersion,
      ),
      _Fields.questions: questions
          .map(
            (question) => _toJson(
              _themeFromQuestionType(question.type),
              question,
              schemeVersion,
            ),
          )
          .toList(),
    };
  }

  ThemeExtension? _themeFromQuestionType(String type) {
    switch (type) {
      case QuestionTypes.choice:
        return commonTheme.choice.theme;
      case QuestionTypes.slider:
        return commonTheme.slider.theme;
      case QuestionTypes.input:
        return commonTheme.input.theme;
      case QuestionTypes.info:
        return commonTheme.info.theme;
    }
    return null;
  }

  Map<String, dynamic>? _toJson(
    ThemeExtension? themeFromQuestionType,
    QuestionData question,
    int schemeVersion,
  ) {
    switch (question.type) {
      case QuestionTypes.choice:
        return ChoiceQuestionDataMapperFactory.getMapper(
          schemeVersion,
        ).toJson(
          question as ChoiceQuestionData,
          commonTheme: themeFromQuestionType,
        );
      case QuestionTypes.slider:
        return SliderQuestionDataMapperFactory.getMapper(
          schemeVersion,
        ).toJson(
          question as SliderQuestionData,
          commonTheme: themeFromQuestionType,
        );
      case QuestionTypes.input:
        return InputQuestionDataMapperFactory.getMapper(
          schemeVersion,
        ).toJson(
          question as InputQuestionData,
          commonTheme: themeFromQuestionType,
        );
      case QuestionTypes.info:
        return InfoQuestionDataMapperFactory.getMapper(
          schemeVersion,
        ).toJson(
          question as InfoQuestionData,
          commonTheme: themeFromQuestionType,
        );
    }
    return null;
  }
}

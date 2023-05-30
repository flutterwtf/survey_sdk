import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/question_types/choice_question_data/choice_question_data_mapper_factory.dart';
import 'package:survey_sdk/src/data/mappers/question_types/input_question_data/input_question_data_mapper_factory.dart';
import 'package:survey_sdk/src/data/mappers/question_types/intro_question_data/intro_question_data_mapper_factory.dart';
import 'package:survey_sdk/src/data/mappers/question_types/slider_question_data/slider_question_data_mapper_factory.dart';
import 'package:survey_sdk/src/domain/entities/api_object.dart';
import 'package:survey_sdk/src/domain/entities/constants/scheme_info.dart';
import 'package:survey_sdk/survey_sdk.dart';

abstract class _Fields {
  static const String questions = 'questions';
  static const String commonTheme = 'commonTheme';
  static const String schemeVersion = 'schemeVersion';
}

/// Holds the core survey data used in the whole app, including the list of
/// questions and the common theme.
class SurveyData with EquatableMixin, ApiObject {
  /// List of questions used to build question pages of different types
  /// of questions.
  final List<QuestionData> questions;

  /// Defines the visual properties used throughout the app.
  final CommonTheme commonTheme;

  @override
  List<Object?> get props => [
        ...questions,
        commonTheme,
      ];

  SurveyData({
    required this.questions,
    required this.commonTheme,
  });

  factory SurveyData.fromJson(Map<String, dynamic> json) {
    final questions = <QuestionData>[];
    final schemeVersion = json[_Fields.schemeVersion];
    for (final questionJson in json[_Fields.questions]) {
      questions.add(QuestionData.fromType(questionJson, schemeVersion));
    }
    return SurveyData(
      questions: questions,
      commonTheme: CommonTheme.fromJson(
        json[_Fields.commonTheme],
        schemeVersion,
      ),
    );
  }

  SurveyData copyWith({
    List<QuestionData>? questions,
    CommonTheme? commonTheme,
  }) {
    return SurveyData(
      questions: questions ?? this.questions,
      commonTheme: commonTheme ?? this.commonTheme,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    const schemeVersion = SchemeInfo.version;
    return {
      _Fields.schemeVersion: schemeVersion,
      _Fields.commonTheme: commonTheme.toJson(
        schemeVersion: schemeVersion,
      ),
      _Fields.questions: questions
          .map(
            (question) => _toJson(
              _themeFromQuestionType(question.type),
              question,
              SchemeInfo.version,
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
      case QuestionTypes.intro:
        return commonTheme.intro.theme;
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
      case QuestionTypes.intro:
        return IntroQuestionDataMapperFactory.getMapper(
          schemeVersion,
        ).toJson(
          question as IntroQuestionData,
          commonTheme: themeFromQuestionType,
        );
    }
    return null;
  }
}

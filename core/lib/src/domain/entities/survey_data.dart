import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/api_object.dart';
import 'package:survey_sdk/src/domain/entities/constants/question_types.dart';
import 'package:survey_sdk/src/domain/entities/constants/scheme_info.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/domain/entities/themes/common_theme.dart';

/// Holds the core survey data used in the whole app, including the list of
/// questions and the common theme
class SurveyData extends ApiObject with EquatableMixin {
  /// List of questions used to build question pages of different types
  /// of questions
  final List<QuestionData> questions;

  /// Defines the visual properties used throughout the app
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
    for (final questionJson in json['questions']) {
      questions.add(QuestionData.fromType(questionJson));
    }
    return SurveyData(
      questions: questions,
      commonTheme: CommonTheme.fromJson(json['commonTheme']),
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
    return {
      'schemeVersion': SchemeInfo.version,
      'commonTheme': commonTheme.toJson(),
      'questions': questions
          .map(
            (question) => question.toJson(
              commonTheme: _themeFromQuestionType(question.type),
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
}

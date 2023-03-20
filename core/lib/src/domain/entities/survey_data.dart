import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/common_theme.dart';
import 'package:survey_core/src/domain/entities/themes/text_field_theme_data.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';

class SurveyData extends ApiObject {
  final List<QuestionData> questions;
  final CommonTheme commonTheme;

  SurveyData({
    required this.questions,
    required this.commonTheme,
  });

  SurveyData.common()
      : this(
          questions: [
            const IntroQuestionData.common(index: 1),
            InputQuestionData.common(index: 2),
          ],
          commonTheme: CommonTheme(
              fill: const Color(0xFFFFFFFF),
              titleColor: const Color(0xFF000000),
              titleSize: 12,
              subtitleColor: const Color(0xFF000000),
              subtitleSize: 12,
              buttonFill: const Color(0xFF000000),
              buttonTextColor: const Color(0xFFFFFFFF),
              buttonTextSize: 12,
              buttonRadius: 10.0,
          ),
        );

  @override
  Map<String, dynamic> toJson() {
    return {
      'commonTheme': commonTheme.toJson(),
      'questions': questions.map((question) => question.toJson()).toList(),
    };
  }

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

  List<Object?> get props => [
        ...questions,
        commonTheme,
      ];
}

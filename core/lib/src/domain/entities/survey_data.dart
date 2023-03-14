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
            textFieldThemeData: const TextFieldThemeData(
              fillCommonColor: AppColors.black,
              fillInputColor: AppColors.white,
              borderColor: AppColors.black,
              borderWidth: AppDimensions.borderWidth,
              verticalPadding: AppDimensions.margin2XS,
              horizontalPadding: AppDimensions.margin2XS,
              hintColor: AppColors.textGrey,
              hintSize: AppFonts.sizeS,
              textColor: AppColors.black,
              textSize: AppFonts.sizeS,
              titleColor: AppColors.black,
              titleSize: AppFonts.sizeM,
              subtitleColor: AppColors.black,
              subtitleSize: AppFonts.sizeS,
              buttonTextSize: AppFonts.sizeS,
              buttonColor: AppColors.white,
              buttonTextColor: AppColors.black,
            ),
            sliderThemeData: const SliderThemeData(),
          ),
        );

  @override
  Map<String, dynamic> toJson() {
    return {
      'commonTheme': commonTheme.toJson(),
      'questions': [
        for (var question in questions) question.toJson(),
      ],
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

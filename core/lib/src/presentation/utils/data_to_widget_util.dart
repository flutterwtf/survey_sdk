import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/question_answer.dart';
import 'package:survey_sdk/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/info_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_sdk/src/presentation/choice_question/choice_question_page.dart';
import 'package:survey_sdk/src/presentation/info_question/info_question_page.dart';
import 'package:survey_sdk/src/presentation/input_question/input_question_page.dart';
import 'package:survey_sdk/src/presentation/slider_question/slider_question_page.dart';

typedef SurveyCallback = void Function({
  required int index,
  required QuestionAnswer? answer,
});

abstract class DataToWidgetUtil {
  static Widget createWidget({
    required QuestionData data,
    required VoidCallback onGoNext,
    required SurveyCallback primaryButtonCallback,
    SurveyCallback? secondaryButtonCallback,
    QuestionAnswer? answer,
  }) {
    switch (data.runtimeType) {
      case SliderQuestionData:
        return SliderQuestionPage(
          data: data as SliderQuestionData,
          answer: answer as QuestionAnswer<double>?,
          onPrimaryButtonTap: primaryButtonCallback,
          onSecondaryButtonTap: secondaryButtonCallback,
        );
      case ChoiceQuestionData:
        return ChoiceQuestionPage(
          data: data as ChoiceQuestionData,
          answer: answer as QuestionAnswer<List<String>>?,
          onPrimaryButtonTap: primaryButtonCallback,
          onSecondaryButtonTap: secondaryButtonCallback,
        );
      case InputQuestionData:
        return InputQuestionPage(
          data: data as InputQuestionData,
          answer: answer,
          onPrimaryButtonTap: primaryButtonCallback,
          onSecondaryButtonTap: secondaryButtonCallback,
        );
      case InfoQuestionData:
        return InfoQuestionPage(
          data: data as InfoQuestionData,
          onPrimaryButtonTap: primaryButtonCallback,
          onSecondaryButtonTap: secondaryButtonCallback,
        );
      default:
        throw Exception('Unimplemented error');
    }
  }
}

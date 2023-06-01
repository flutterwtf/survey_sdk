import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/question_answer.dart';
import 'package:survey_sdk/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_sdk/src/presentation/choice_question/choice_question_page.dart';
import 'package:survey_sdk/src/presentation/input_question/input_question_page.dart';
import 'package:survey_sdk/src/presentation/intro_question/intro_question_page.dart';
import 'package:survey_sdk/src/presentation/slider_question/slider_question_page.dart';

typedef OnSendCallback = void Function({
  required int index,
  required QuestionAnswer answer,
});

abstract class DataToWidgetUtil {
  static Widget createWidget({
    required QuestionData data,
    required OnSendCallback onSend,
    required VoidCallback onGoNext,
    QuestionAnswer? answer,
  }) {
    void sendAndGoNext({required int index, required QuestionAnswer answer}) {
      onSend(index: index, answer: answer);
      onGoNext();
    }

    switch (data.runtimeType) {
      case SliderQuestionData:
        return SliderQuestionPage(
          data: data as SliderQuestionData,
          answer: answer as QuestionAnswer<double>?,
          onSend: sendAndGoNext,
        );
      case ChoiceQuestionData:
        return ChoiceQuestionPage(
          data: data as ChoiceQuestionData,
          answer: answer as QuestionAnswer<List<int>>?,
          onSend: sendAndGoNext,
        );
      case InputQuestionData:
        return InputQuestionPage(
          data: data as InputQuestionData,
          answer: answer,
          onSend: sendAndGoNext,
        );
      case IntroQuestionData:
        return IntroQuestionPage(
          data: data as IntroQuestionData,
          onMainButtonTap: onGoNext,
        );
      default:
        throw Exception('Unimplemented error');
    }
  }
}

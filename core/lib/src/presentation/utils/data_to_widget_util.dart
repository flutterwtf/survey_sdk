import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_core/src/presentation/choice_question/choice_question_page.dart';
import 'package:survey_core/src/presentation/input_question/input_question_page.dart';
import 'package:survey_core/src/presentation/intro_question/intro_question_page.dart';
import 'package:survey_core/src/presentation/slider_question/slider_question_page.dart';

typedef OnSendCallback = void Function({
  required int index,
  required dynamic data,
});

abstract class DataToWidgetUtil {
  static Widget createWidget(QuestionData data, OnSendCallback onSend) {
    switch (data.runtimeType) {
      case SliderQuestionData:
        return SliderQuestionPage(
          data: data as SliderQuestionData,
          onSend: onSend,
        );
      case ChoiceQuestionData:
        return ChoiceQuestionPage(
          data: data as ChoiceQuestionData,
          onSend: onSend,
        );
      case InputQuestionData:
        return InputQuestionPage(
          data: data as InputQuestionData,
          onSend: onSend,
        );
      case IntroQuestionData:
        return IntroQuestionPage(
          data: data as IntroQuestionData,
          onSend: onSend,
        );
      default:
        throw Exception('Unimplemented error');
    }
  }
}

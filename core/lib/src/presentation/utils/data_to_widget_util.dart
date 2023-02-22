import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_core/src/presentation/slider_question/slider_question_page.dart';

//TODO: dynamic to survey result
typedef OnSendCallback = void Function(dynamic data);

abstract class DataToWidgetUtil {
  static Widget createWidget(QuestionData data, OnSendCallback onSend) {
    switch (data.runtimeType) {
      case SliderQuestionData: return SliderQuestionPage(data: data as SliderQuestionData, onSend: onSend);
      default: throw Exception('Unimplemented error');
    }
  }
}
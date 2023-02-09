import 'package:flutter/src/material/theme.dart';
import 'package:survey_sdk/domain/entities/question_types/choice_questions/choice_question.dart';

class RadioButtonQuestion extends ChoiceQuestion {
  RadioButtonQuestion(
      {required super.isMultiple,
        required super.questions,
        required super.title,
        required super.subtitle,
        required super.typeQuestion,
        required super.isSkip});

  @override
  // TODO: implement theme
  Theme get theme => throw UnimplementedError();

  @override
  String get type => 'RadioButtonQuestion';
}

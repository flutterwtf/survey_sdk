import 'package:core/domain/entities/question_types/choice_questions/choice_question.dart';
import 'package:flutter/material.dart';

class RadioButtonQuestion extends ChoiceQuestion {
  const RadioButtonQuestion({
    required super.isMultiple,
    required super.questions,
    required super.title,
    required super.subtitle,
    required super.typeQuestion,
    required super.isSkip,
    required super.payload,
  });

  @override
  // TODO: implement theme
  Theme get theme => throw UnimplementedError();

  @override
  String get type => 'RadioButtonQuestion';
}

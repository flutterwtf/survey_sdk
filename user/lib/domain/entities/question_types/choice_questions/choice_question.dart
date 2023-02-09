import 'package:flutter/src/material/theme.dart';
import 'package:survey_sdk/domain/entities/question/question.dart';
import 'package:survey_sdk/domain/entities/question_types/type_question.dart';

abstract class ChoiceQuestion extends TypeQuestion {
  final bool isMultiple;
  final List<Question> questions;

  ChoiceQuestion(
      {required this.isMultiple,
        required this.questions,
        required super.title,
        required super.subtitle,
        required super.typeQuestion,
        required super.isSkip});

  @override
  // TODO: implement theme
  Theme get theme => throw UnimplementedError();
}

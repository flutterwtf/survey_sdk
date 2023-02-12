import 'package:core/domain/entities/question/question.dart';
import 'package:core/domain/entities/question_types/type_question.dart';
import 'package:flutter/material.dart';

abstract class ChoiceQuestion extends TypeQuestion {
  final bool isMultiple;
  final List<Question> questions;

  const ChoiceQuestion({
    required this.isMultiple,
    required this.questions,
    required super.title,
    required super.subtitle,
    required super.typeQuestion,
    required super.isSkip,
    required super.payload,
  });

  @override
  // TODO: implement theme
  Theme get theme => throw UnimplementedError();
}

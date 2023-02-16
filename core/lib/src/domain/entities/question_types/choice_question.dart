import 'package:core/src/domain/entities/question_types/type_question.dart';
import 'package:flutter/material.dart';

abstract class ChoiceQuestion extends TypeQuestion {
  final bool isMultipleChoice;
  final List<String> options;

  const ChoiceQuestion({
    required this.isMultipleChoice,
    required this.options,
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

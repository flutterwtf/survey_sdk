import 'package:core/domain/entities/question_types/type_question.dart';
import 'package:core/domain/entities/validator/input_validator.dart';
import 'package:flutter/material.dart';


class InputQuestion extends TypeQuestion {
  final InputValidator validator;
  final int value;

  const InputQuestion({
    required this.validator,
    required this.value,
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
  String get type => 'InputQuestion';
}

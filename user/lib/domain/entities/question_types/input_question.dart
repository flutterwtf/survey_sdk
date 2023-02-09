import 'package:flutter/src/material/theme.dart';
import 'package:survey_sdk/domain/entities/validator/input_validator.dart';

import 'type_question.dart';

class InputQuestion extends TypeQuestion {
  final InputValidator validator;
  final int value;

  InputQuestion(
      {required this.validator,
      required this.value,
      required super.title,
      required super.subtitle,
      required super.typeQuestion,
      required super.isSkip});

  @override
  // TODO: implement theme
  Theme get theme => throw UnimplementedError();

  @override
  String get type => 'InputQuestion';
}

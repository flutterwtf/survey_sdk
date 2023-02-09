import 'package:flutter/src/material/theme.dart';

import 'type_question.dart';

class SliderQuestion extends TypeQuestion {
  final int minValue;
  final int maxValue;

  SliderQuestion(
      {required this.minValue,
        required this.maxValue,
        required super.title,
        required super.subtitle,
        required super.typeQuestion,
        required super.isSkip});

  @override
  // TODO: implement theme
  Theme get theme => throw UnimplementedError();

  @override
  String get type => 'SliderQuestion';
}

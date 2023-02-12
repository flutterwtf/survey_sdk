import 'package:core/domain/entities/question_types/type_question.dart';
import 'package:flutter/material.dart';

class IntroQuestion extends TypeQuestion {
  const IntroQuestion({
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
  String get type => 'IntroQuestion';
}

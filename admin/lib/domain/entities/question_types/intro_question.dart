import 'package:flutter/src/material/theme.dart';

import 'type_question.dart';

class IntroQuestion extends TypeQuestion {
  IntroQuestion(
      {required super.title,
      required super.subtitle,
      required super.typeQuestion,
      required super.isSkip});

  @override
  // TODO: implement theme
  Theme get theme => throw UnimplementedError();

  @override
  String get type => 'IntroQuestion';
}

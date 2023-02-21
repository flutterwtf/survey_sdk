import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:flutter/material.dart';

class IntroQuestionData extends QuestionData {
  const IntroQuestionData({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.typeQuestion,
    required super.isSkip,
    super.info,
  });

  @override
  // TODO: implement theme
  Theme? get theme => throw UnimplementedError();

  @override
  String get type => 'Intro';

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'subtitle': subtitle,
    'typeQuestion': typeQuestion,
    'isSkip': isSkip,
    'info': info,
  };

  static IntroQuestionData fromJson(Map<String, dynamic> json) {
    return IntroQuestionData(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      typeQuestion: json['typeQuestion'],
      isSkip: json['isSkip'],
      info: json['info'],
    );
  }
}

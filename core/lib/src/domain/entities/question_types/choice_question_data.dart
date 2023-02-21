import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:flutter/material.dart';

class ChoiceQuestionData extends QuestionData {
  final bool isMultipleChoice;
  final List<String> options;

  const ChoiceQuestionData({
    required this.isMultipleChoice,
    required this.options,
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
  String get type => 'Choice';

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'isMultipleChoice': isMultipleChoice,
    'options': options,
    'title': title,
    'subtitle': subtitle,
    'typeQuestion': typeQuestion,
    'isSkip': isSkip,
    'info': info,
  };

  static ChoiceQuestionData fromJson(Map<String, dynamic> json) {
    return ChoiceQuestionData(
        id: json['id'],
        isMultipleChoice: json['isMultipleChoice'],
        options: json['options'],
        title: json['title'],
        subtitle: json['subtitle'],
        typeQuestion: json['typeQuestion'],
        isSkip: json['isSkip'],
        info: json['info'],
    );
  }
}

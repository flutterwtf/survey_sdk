import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/validator/input_validator.dart';
import 'package:flutter/material.dart';


class InputQuestionData extends QuestionData {
  final InputValidator validator;
  final int value;

  const InputQuestionData({
    required this.validator,
    required this.value,
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
  String get type => 'Input';

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'validator': validator,
    'value': value,
    'title': title,
    'subtitle': subtitle,
    'typeQuestion': typeQuestion,
    'isSkip': isSkip,
    'info': info,
  };

  static InputQuestionData fromJson(Map<String, dynamic> json) {
    return InputQuestionData(
      id: json['id'],
      validator: json['validator'],
      value: json['value'],
      title: json['title'],
      subtitle: json['subtitle'],
      typeQuestion: json['typeQuestion'],
      isSkip: json['isSkip'],
      info: json['info'],
    );
  }
}

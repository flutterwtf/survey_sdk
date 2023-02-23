import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:flutter/material.dart';

class SliderQuestionData extends QuestionData<SliderThemeData> {
  final num minValue;
  final num maxValue;
  final num initialValue;
  const SliderQuestionData({
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required super.id,
    required super.title,
    required super.subtitle,
    required super.typeQuestion,
    required super.isSkip,
    super.info,
  });

  //TODO: do like this in every question widget
  //TODO: implement theme
  @override
  SliderThemeData? get theme => null;

  @override
  String get type => 'Slider';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'minValue': minValue,
        'maxValue': maxValue,
        'initialValue': initialValue,
        'title': title,
        'subtitle': subtitle,
        'typeQuestion': typeQuestion,
        'isSkip': isSkip,
        'info': info,
      };

  static SliderQuestionData fromJson(Map<String, dynamic> json) {
    return SliderQuestionData(
      id: json['id'],
      minValue: json['minValue'],
      maxValue: json['maxValue'],
      initialValue: json['initialValue'],
      title: json['title'],
      subtitle: json['subtitle'],
      typeQuestion: json['typeQuestion'],
      isSkip: json['isSkip'],
      info: json['info'],
    );
  }
}

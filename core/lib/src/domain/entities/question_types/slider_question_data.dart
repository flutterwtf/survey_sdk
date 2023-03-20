import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/constants/question_types.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';

class SliderQuestionData extends QuestionData<SliderThemeData> {
  final num minValue;
  final num maxValue;
  final num initialValue;

  const SliderQuestionData({
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required super.index,
    required super.title,
    required super.subtitle,
    required super.isSkip,
    super.content,
  });

  @override
  SliderQuestionData copyWith({
    num? minValue,
    num? maxValue,
    num? initialValue,
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
  }) {
    return SliderQuestionData(
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
      initialValue: initialValue ?? this.initialValue,
      index: index ?? this.index,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isSkip: isSkip ?? this.isSkip,
    );
  }

  // TODO(dev): do like this in every question widget
  // TODO(dev): implement theme
  @override
  SliderThemeData? get theme => null;

  @override
  String get type => QuestionTypes.slider;

  @override
  Map<String, dynamic> toJson() => {
        'index': index,
        'minValue': minValue,
        'maxValue': maxValue,
        'initialValue': initialValue,
        'title': title,
        'subtitle': subtitle,
        'type': type,
        'isSkip': isSkip,
        'content': content,
      };

  factory SliderQuestionData.fromJson(Map<String, dynamic> json) {
    return SliderQuestionData(
      index: json['index'],
      minValue: json['minValue'],
      maxValue: json['maxValue'],
      initialValue: json['initialValue'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
    );
  }

  @override
  List<Object?> get props => [
        minValue,
        maxValue,
        initialValue,
        index,
        title,
        subtitle,
        isSkip,
        content,
      ];
}

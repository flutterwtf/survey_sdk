import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:flutter/material.dart';

class SliderQuestionData extends QuestionData<SliderThemeData> {
  final num minValue;
  final num maxValue;
  final num initialValue;

  SliderQuestionData({
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required super.index,
    required super.title,
    required super.subtitle,
    required super.isSkip,
    super.content,
  });

  SliderQuestionData.common({int index = 0})
      : this(
          //TODO: to localization somehow
          minValue: 0,
          maxValue: 10,
          initialValue: 5,
          title: 'Intro',
          index: index,
          subtitle: '',
          isSkip: false,
          content:
              'You may simply need a single, brief answer without discussion. Other times, you may want to talk through a scenario, evaluate how well a group is learning new material or solicit feedback. The types of questions you ask directly impact the type of answer you receive.',
        );

  @override
  QuestionData copyWith({
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

  //TODO: do like this in every question widget
  //TODO: implement theme
  @override
  SliderThemeData? get theme => null;

  @override
  String get type => 'Slider';

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

  static SliderQuestionData fromJson(Map<String, dynamic> json) {
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
  // TODO: implement props
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

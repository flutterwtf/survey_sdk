import 'package:flutter/material.dart';
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

  const SliderQuestionData.common({int index = 0})
      : this(
          // TODO(dev): to localization somehow
          minValue: 0,
          maxValue: 10,
          initialValue: 5,
          title: 'Intro',
          index: index,
          subtitle: '',
          isSkip: false,
          content:
              'You may simply need a single, brief answer without discussion. '
              'Other times, you may want to talk through a scenario, evaluate '
              'how well a group is learning new material or solicit feedback. '
              'The types of questions you ask directly impact the type of '
              'answer you receive.',
        );

  // TODO(dev): do like this in every question widget
  // TODO(dev): implement theme
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
  // TODO(dev): implement props
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

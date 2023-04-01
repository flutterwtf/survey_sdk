import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/constants/question_types.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/slider_question_theme.dart';

/// Contains the content for a page with slider to choose a value between
/// minimum and maximum range
class SliderQuestionData extends QuestionData<SliderThemeData> {
  /// The minimum value of the slider
  final num minValue;

  /// The maximum value of the slider
  final num maxValue;

  /// The initial value of the slider
  final num initialValue;
  final int divisions;
  final SliderQuestionTheme? theme;

  @override
  String get type => QuestionTypes.slider;

  @override
  List<Object?> get props => [
    minValue,
    maxValue,
    initialValue,
    divisions,
    index,
    title,
    subtitle,
    isSkip,
    content,
  ];

  const SliderQuestionData({
    required this.minValue,
    required this.maxValue,
    required this.divisions,
    required this.initialValue,
    required this.theme,
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
          divisions: 10,
          initialValue: 5,
          title: 'Intro',
          index: index,
          subtitle: '',
          isSkip: false,
          theme: null,
          content:
              'You may simply need a single, brief answer without discussion. '
              'Other times, you may want to talk through a scenario, evaluate '
              'how well a group is learning new material or solicit feedback. '
              'The types of questions you ask directly impact the type of '
              'answer you receive.',
        );

  factory SliderQuestionData.fromJson(Map<String, dynamic> json) {
    final theme = json['theme'];
    return SliderQuestionData(
      index: json['index'],
      minValue: json['minValue'],
      maxValue: json['maxValue'],
      divisions: json['divisions'],
      initialValue: json['initialValue'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      theme: theme != null ? SliderQuestionTheme.fromJson(theme) : null,
    );
  }

  @override
  SliderQuestionData copyWith({
    num? minValue,
    num? maxValue,
    num? initialValue,
    int? divisions,
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
    SliderQuestionTheme? theme,
  }) {
    return SliderQuestionData(
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
      initialValue: initialValue ?? this.initialValue,
      index: index ?? this.index,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      divisions: divisions ?? this.divisions,
      isSkip: isSkip ?? this.isSkip,
      theme: theme ?? this.theme,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'index': index,
        'theme': theme?.toJson(),
        'minValue': minValue,
        'maxValue': maxValue,
        'divisions': divisions,
        'initialValue': initialValue,
        'title': title,
        'subtitle': subtitle,
        'type': type,
        'isSkip': isSkip,
        'content': content,
      };
}

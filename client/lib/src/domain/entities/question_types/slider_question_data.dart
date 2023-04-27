import 'package:flutter/material.dart';
import 'package:survey_client/src/domain/entities/constants/question_types.dart';
import 'package:survey_client/src/domain/entities/question_types/question_data.dart';
import 'package:survey_client/src/domain/entities/themes/slider_question_theme.dart';

const _maxValue = 10;
const _divisions = 8;
const _initialValue = 5;

/// Contains the content for a page with slider to choose a value between
/// minimum and maximum range
class SliderQuestionData extends QuestionData<SliderThemeData> {
  /// The minimum value of the slider
  final int minValue;

  /// The maximum value of the slider
  final int maxValue;

  /// The initial value of the slider
  final int initialValue;
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
        theme,
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
          maxValue: _maxValue,
          divisions: _divisions,
          initialValue: _initialValue,
          title: 'Slider',
          index: index,
          subtitle: '',
          isSkip: false,
          theme: const SliderQuestionTheme.common(),
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
      theme: theme != null
          ? SliderQuestionTheme.fromJson(theme)
          : const SliderQuestionTheme.common(),
    );
  }

  @override
  SliderQuestionData copyWith({
    int? minValue,
    int? maxValue,
    int? initialValue,
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
      content: content ?? this.content,
      divisions: divisions ?? this.divisions,
      isSkip: isSkip ?? this.isSkip,
      theme: theme ?? this.theme,
    );
  }

  @override
  Map<String, dynamic> toJson({dynamic commonTheme}) {
    late final SliderQuestionTheme? theme;
    //ignore: prefer-conditional-expressions
    if (commonTheme != null) {
      theme = commonTheme == this.theme ? null : this.theme;
    } else {
      theme = this.theme;
    }
    return {
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
}

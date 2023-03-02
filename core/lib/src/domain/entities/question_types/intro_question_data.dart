import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';

class IntroQuestionData extends QuestionData {
  final String mainButtonTitle;

  const IntroQuestionData({
    required this.mainButtonTitle,
    required super.index,
    required super.title,
    required super.subtitle,
    required super.isSkip,
    super.content,
  });

  const IntroQuestionData.common({int index = 0})
      : this(
          // TODO(dev): to localization somehow
          mainButtonTitle: 'NEXT',
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

  @override
  // TODO(dev): implement theme
  Theme? get theme => throw UnimplementedError();

  @override
  String get type => 'Intro';

  @override
  Map<String, dynamic> toJson() => {
        'index': index,
        'title': title,
        'subtitle': subtitle,
        'type': type,
        'isSkip': isSkip,
        'content': content,
        'payload': {
          'mainButtonTitle': mainButtonTitle,
        },
      };

  factory IntroQuestionData.fromJson(Map<String, dynamic> json) {
    final payload = json['payload'] as Map<String, dynamic>;
    return IntroQuestionData(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      mainButtonTitle: payload['mainButtonTitle'],
    );
  }

  @override
  // TODO(dev): implement props
  List<Object?> get props => [
        mainButtonTitle,
        index,
        title,
        subtitle,
        isSkip,
        content,
      ];
}

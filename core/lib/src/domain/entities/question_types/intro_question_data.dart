import 'package:survey_core/src/domain/entities/constants/question_types.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:flutter/material.dart';

class IntroQuestionData extends QuestionData {
  final String mainButtonTitle;

  IntroQuestionData({
    required this.mainButtonTitle,
    required super.index,
    required super.title,
    required super.subtitle,
    required super.isSkip,
    super.content,
  });

  IntroQuestionData.common({int index = 0})
      : this(
          //TODO: to localization somehow
          mainButtonTitle: 'NEXT',
          title: 'Intro',
          index: index,
          subtitle: '',
          isSkip: false,
          content:
              'You may simply need a single, brief answer without discussion. Other times, you may want to talk through a scenario, evaluate how well a group is learning new material or solicit feedback. The types of questions you ask directly impact the type of answer you receive.',
        );

  @override
  // TODO: implement theme
  Theme? get theme => throw UnimplementedError();

  @override
  String get type => QuestionTypes.intro;

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

  static IntroQuestionData fromJson(Map<String, dynamic> json) {
    final payload = json['payload'];
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
  // TODO: implement props
  List<Object?> get props => [
        mainButtonTitle,
        index,
        title,
        subtitle,
        isSkip,
        content,
      ];
}

import 'package:survey_core/src/domain/entities/constants/question_data_common.dart';
import 'package:survey_core/src/domain/entities/constants/question_types.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/intro_question_theme.dart';

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
          mainButtonTitle: QuestionDataCommon.introQuestionMainButtonTitle,
          title: QuestionDataCommon.introQuestionTitle,
          index: index,
          subtitle: QuestionDataCommon.choiceQuestionSubtitle,
          isSkip: false,
          content: QuestionDataCommon.questionContent,
        );

  @override
  IntroQuestionData copyWith({
    String? mainButtonTitle,
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
  }) {
    return IntroQuestionData(
      mainButtonTitle: mainButtonTitle ?? this.mainButtonTitle,
      index: index ?? this.index,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isSkip: isSkip ?? this.isSkip,
    );
  }

  @override
  IntroQuestionTheme? get theme => const IntroQuestionTheme.common();

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
  List<Object?> get props => [
        mainButtonTitle,
        index,
        title,
        subtitle,
        isSkip,
        content,
      ];
}

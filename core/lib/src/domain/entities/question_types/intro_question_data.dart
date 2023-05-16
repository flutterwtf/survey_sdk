import 'package:survey_sdk/src/domain/entities/constants/question_types.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/domain/entities/themes/intro_question_theme.dart';

/// Contains the content for the introduction question
class IntroQuestionData extends QuestionData {
  final IntroQuestionTheme? theme;

  @override
  String get type => QuestionTypes.intro;

  @override
  List<Object?> get props => [
        theme,
        index,
        title,
        subtitle,
        isSkip,
        content,
        secondaryButtonText,
        primaryButtonText,
      ];

  const IntroQuestionData({
    required this.theme,
    required super.index,
    required super.title,
    required super.subtitle,
    required super.isSkip,
    required super.secondaryButtonText,
    required super.primaryButtonText,
    super.content,
  });

  const IntroQuestionData.common({int index = 0})
      : this(
          // TODO(dev): to localization somehow
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
          theme: const IntroQuestionTheme.common(),
          secondaryButtonText: 'SKIP',
          primaryButtonText: 'NEXT',
        );

  @override
  IntroQuestionData copyWith({
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
    IntroQuestionTheme? theme,
    String? secondaryButtonText,
    String? primaryButtonText,
  }) {
    return IntroQuestionData(
      index: index ?? this.index,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      content: content ?? this.content,
      isSkip: isSkip ?? this.isSkip,
      theme: theme ?? this.theme,
      secondaryButtonText: secondaryButtonText ?? this.secondaryButtonText,
      primaryButtonText: primaryButtonText ?? this.primaryButtonText,
    );
  }
}

import 'package:survey_sdk/src/domain/entities/actions/survey_action.dart';
import 'package:survey_sdk/src/domain/entities/constants/question_types.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/domain/entities/themes/info_question_theme.dart';

/// Data class representing an information question.
///
/// The [InfoQuestionData] class extends the [QuestionData] class and provides
/// additional property specific to information questions.
class InfoQuestionData extends QuestionData {
  /// The theme applied to the information question.
  /// Default value is [InfoQuestionTheme.common()].
  final InfoQuestionTheme? theme;

  @override
  String get type => QuestionTypes.info;

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
        mainButtonAction,
        secondaryButtonAction,
      ];

  const InfoQuestionData({
    required this.theme,
    required super.index,
    required super.title,
    required super.subtitle,
    required super.isSkip,
    required super.secondaryButtonText,
    required super.primaryButtonText,
    super.mainButtonAction,
    super.secondaryButtonAction,
    super.content,
  });

  /// Creates a common instance of [InfoQuestionData].
  ///
  /// The [InfoQuestionData.common] constructor is a convenience constructor
  /// that creates a common instance of [InfoQuestionData] with predefined
  /// values.
  const InfoQuestionData.common({int index = 0})
      : this(
          // TODO(dev): to localization somehow
          title: 'Info',
          index: index,
          subtitle: '',
          isSkip: false,
          content:
              'You may simply need a single, brief answer without discussion. '
              'Other times, you may want to talk through a scenario, evaluate '
              'how well a group is learning new material or solicit feedback. '
              'The types of questions you ask directly impact the type of '
              'answer you receive.',
          theme: const InfoQuestionTheme.common(),
          secondaryButtonText: 'SKIP',
          primaryButtonText: 'NEXT',
        );

  @override
  InfoQuestionData copyWith({
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
    InfoQuestionTheme? theme,
    String? secondaryButtonText,
    String? primaryButtonText,
    SurveyAction? mainButtonAction,
    SurveyAction? secondaryButtonAction,
  }) {
    return InfoQuestionData(
      index: index ?? this.index,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      content: content ?? this.content,
      isSkip: isSkip ?? this.isSkip,
      theme: theme ?? this.theme,
      secondaryButtonText: secondaryButtonText ?? this.secondaryButtonText,
      primaryButtonText: primaryButtonText ?? this.primaryButtonText,
      mainButtonAction: mainButtonAction ?? this.mainButtonAction,
      secondaryButtonAction:
          secondaryButtonAction ?? this.secondaryButtonAction,
    );
  }
}

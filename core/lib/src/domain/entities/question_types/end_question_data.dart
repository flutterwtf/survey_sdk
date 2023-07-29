import 'package:survey_sdk/src/domain/entities/actions/go_next_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/skip_question_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/survey_action.dart';
import 'package:survey_sdk/src/domain/entities/constants/question_types.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/domain/entities/themes/end_question_theme.dart';

/// Data class representing an information question.
///
/// The [EndQuestionData] class extends the [QuestionData] class and provides
/// additional property specific to information questions.
class EndQuestionData extends QuestionData {
  /// The theme applied to the information question.
  /// Default value is [EndQuestionTheme.common()].
  final EndQuestionTheme? theme;

  @override
  String get type => QuestionTypes.end;

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

  const EndQuestionData({
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

  /// Creates a common instance of [EndQuestionData].
  ///
  /// The [EndQuestionData.common] constructor is a convenience constructor
  /// that creates a common instance of [EndQuestionData] with predefined
  /// values.
  const EndQuestionData.common({int index = 0})
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
    theme: const EndQuestionTheme.common(),
    secondaryButtonText: 'SKIP',
    primaryButtonText: 'NEXT',
    mainButtonAction: const GoNextAction(),
    secondaryButtonAction: const SkipQuestionAction(),
  );

  @override
  EndQuestionData copyWith({
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
    EndQuestionTheme? theme,
    String? secondaryButtonText,
    String? primaryButtonText,
    SurveyAction? mainButtonAction,
    SurveyAction? secondaryButtonAction,
    bool clearMainAction = false,
    bool clearSecondaryAction = false,
  }) {
    return EndQuestionData(
      index: index ?? this.index,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      content: content ?? this.content,
      isSkip: isSkip ?? this.isSkip,
      theme: theme ?? this.theme,
      secondaryButtonText: secondaryButtonText ?? this.secondaryButtonText,
      primaryButtonText: primaryButtonText ?? this.primaryButtonText,
      mainButtonAction: clearMainAction
          ? mainButtonAction
          : mainButtonAction ?? this.mainButtonAction,
      secondaryButtonAction: clearSecondaryAction
          ? secondaryButtonAction
          : secondaryButtonAction ?? this.secondaryButtonAction,
    );
  }
}

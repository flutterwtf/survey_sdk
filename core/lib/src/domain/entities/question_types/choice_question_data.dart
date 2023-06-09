import 'package:survey_sdk/src/domain/entities/constants/question_types.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/domain/entities/themes/choice_question_theme.dart';

/// Data class representing a question with multiple or single choice.
///
/// The [ChoiceQuestionData] class extends the [QuestionData] class and provides
/// additional properties and methods specific to choice questions.
class ChoiceQuestionData extends QuestionData<ChoiceQuestionTheme> {
  /// Indicates whether the question allows multiple answers or only a
  /// single answer.
  /// Default value is [```false```].
  final bool isMultipleChoice;

  /// Contains the text for each answer option.
  /// Default value is [['First option', 'Second option', 'Third option']].
  final List<String> options;

  /// Options that were set as default ones.
  /// Default value is [```null```].
  final List<String>? selectedByDefault;

  /// The type of rule associated with the question.
  ///
  /// The [ruleType] determines how the number of selected options is compared
  /// with the [ruleValue]. It specifies the criteria for evaluating the answer
  /// based on the number of selected options.
  /// Default value is [RuleType.none].
  final RuleType ruleType;

  /// The value of the rule associated with the question.
  ///
  /// The [ruleValue] represents the threshold against which the number of
  /// selected options is compared based on the [ruleType]. The comparison is
  /// performed to evaluate whether the answer meets the rule criteria.
  /// Default value is [0].
  final int ruleValue;

  /// The theme applied to the choice question.
  /// Default value is [ChoiceQuestionTheme.common()].
  final ChoiceQuestionTheme? theme;

  @override
  String get type => QuestionTypes.choice;

  @override
  List<Object?> get props => [
        isMultipleChoice,
        ...options,
        index,
        title,
        subtitle,
        isSkip,
        content,
        selectedByDefault,
        theme,
        ruleType,
        ruleValue,
        secondaryButtonText,
        primaryButtonText,
      ];

  const ChoiceQuestionData({
    required this.isMultipleChoice,
    required this.options,
    required this.ruleType,
    required this.ruleValue,
    required this.theme,
    required super.index,
    required super.title,
    required super.subtitle,
    required super.isSkip,
    required super.secondaryButtonText,
    required super.primaryButtonText,
    super.content,
    this.selectedByDefault,
  }) : assert(
          selectedByDefault == null ||
              (!isMultipleChoice && selectedByDefault.length == 1) ||
              (isMultipleChoice && selectedByDefault.length > 0),
          'Selected options should be null, or in case of single '
          'choice buttons have the length of 1, and in '
          'case of multiple choice higher than zero',
        );

  // TODO(dev): remove common.
  /// Creates a common instance of [ChoiceQuestionData].
  ///
  /// The [ChoiceQuestionData.common] constructor is a convenience constructor
  /// that creates a common instance of [ChoiceQuestionData] with predefined
  /// values.
  const ChoiceQuestionData.common({int index = 0})
      : this(
          // TODO(dev): To localization somehow.
          isMultipleChoice: false,
          theme: const ChoiceQuestionTheme.common(),
          options: const ['First option', 'Second option', 'Third option'],
          ruleType: RuleType.none,
          ruleValue: 0,
          title: 'Title',
          subtitle: '',
          isSkip: false,
          content:
              'You may simply need a single, brief answer without discussion. '
              'Other times, you may want to talk through a scenario, evaluate '
              'how well a group is learning new material or solicit feedback. '
              'The types of questions you ask directly impact the type of '
              'answer you receive.',
          index: index,
          primaryButtonText: 'NEXT',
          secondaryButtonText: 'SKIP',
        );

  @override
  ChoiceQuestionData copyWith({
    bool? isMultipleChoice,
    List<String>? options,
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
    List<String>? selectedByDefault,
    RuleType? ruleType,
    int? ruleValue,
    ChoiceQuestionTheme? theme,
    String? secondaryButtonText,
    String? primaryButtonText,
    bool clearSelectedByDefault = false,
  }) {
    return ChoiceQuestionData(
      isMultipleChoice: isMultipleChoice ?? this.isMultipleChoice,
      options: options ?? this.options,
      theme: theme ?? this.theme,
      ruleType: ruleType ?? this.ruleType,
      ruleValue: ruleValue ?? this.ruleValue,
      index: index ?? this.index,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      content: content ?? this.content,
      isSkip: isSkip ?? this.isSkip,
      selectedByDefault: clearSelectedByDefault
          ? null
          : selectedByDefault ?? this.selectedByDefault,
      secondaryButtonText: secondaryButtonText ?? this.secondaryButtonText,
      primaryButtonText: primaryButtonText ?? this.primaryButtonText,
    );
  }
}

/// Enumeration representing the types of rules for a question.
enum RuleType {
  /// No rule associated with the question.
  none('None'),

  /// Rule indicating that the answer should have more selected options than
  /// the specified value.
  more('>'),

  /// Rule indicating that the answer should have fewer options selected than
  /// the specified value.
  less('<'),

  /// Rule indicating that the answer should have more or equal selected options
  /// than the specified value.
  moreOrEqual('>='),

  /// Rule indicating that the answer should have fewer or equal selected
  /// options than the specified value.
  lessOrEqual('<='),

  /// Rule indicating that the answer should have exactly the same number of
  /// selected options as the specified value.
  equal('=');

  const RuleType(
    this.name,
  );

  final String name;
}

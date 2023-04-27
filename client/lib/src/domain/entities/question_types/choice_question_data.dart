import 'package:survey_client/src/domain/entities/constants/question_types.dart';
import 'package:survey_client/src/domain/entities/question_types/question_data.dart';
import 'package:survey_client/src/domain/entities/themes/choice_question_theme.dart';

/// Contains the content for a multiple-choice or single-choice question
class ChoiceQuestionData extends QuestionData<ChoiceQuestionTheme> {
  /// Indicates whether the question allows multiple answers or only a
  /// single answer
  final bool isMultipleChoice;

  /// Contains the text for each answer option
  final List<String> options;

  /// Options that have been selected
  final List<int>? selectedOptions;
  final RuleType ruleType;
  final int ruleValue;
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
        selectedOptions,
        theme,
        ruleType,
        ruleValue,
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
    super.content,
    this.selectedOptions,
  }) : assert(
          selectedOptions == null ||
              (!isMultipleChoice && selectedOptions.length == 1) ||
              (isMultipleChoice && selectedOptions.length > 0),
          'Selected options should be null, or in case of single '
          'choice buttons have the length of 1, and in '
          'case of multiple choice higher than zero',
        );

  // TODO(dev): remove common.
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
        );

  factory ChoiceQuestionData.fromJson(Map<String, dynamic> json) {
    final payload = json['payload'] as Map<String, dynamic>;
    final theme = json['theme'];
    return ChoiceQuestionData(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      isMultipleChoice: payload['isMultipleChoice'],
      options: (payload['options'] as List<dynamic>).cast<String>(),
      selectedOptions: payload['selectedOptions'] != null
          ? (payload['selectedOptions'] as List<dynamic>).cast<int>()
          : null,
      ruleType: RuleType.values[payload['ruleType']],
      ruleValue: payload['ruleValue'],
      theme: theme != null
          ? ChoiceQuestionTheme.fromJson(theme)
          : const ChoiceQuestionTheme.common(),
    );
  }

  @override
  ChoiceQuestionData copyWith({
    bool? isMultipleChoice,
    List<String>? options,
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
    List<int>? selectedOptions,
    RuleType? ruleType,
    int? ruleValue,
    ChoiceQuestionTheme? theme,
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
      selectedOptions: selectedOptions ?? this.selectedOptions,
    );
  }

  @override
  Map<String, dynamic> toJson({dynamic commonTheme}) {
    late final ChoiceQuestionTheme? theme;
    //ignore: prefer-conditional-expressions
    if (commonTheme != null) {
      theme = commonTheme == this.theme ? null : this.theme;
    } else {
      theme = this.theme;
    }
    return {
      'index': index,
      'title': title,
      'subtitle': subtitle,
      'type': type,
      'isSkip': isSkip,
      'content': content,
      'theme': theme?.toJson(),
      // TODO(dev): Do we need payload?
      // TODO(dev): Should we move keys to const?
      'payload': {
        'isMultipleChoice': isMultipleChoice,
        'options': options,
        'selectedOptions': selectedOptions,
        'ruleType': ruleType.index,
        'ruleValue': ruleValue,
      },
    };
  }
}

enum RuleType {
  none('None'),
  more('>'),
  less('<'),
  moreOrEqual('>='),
  lessOrEqual('<='),
  equal('=');

  const RuleType(
    this.name,
  );

  final String name;
}

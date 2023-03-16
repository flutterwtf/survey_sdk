import 'package:survey_core/src/domain/entities/constants/question_types.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/choice_question_theme.dart';

class ChoiceQuestionData extends QuestionData<ChoiceQuestionTheme> {
  final bool isMultipleChoice;
  final List<String> options;
  final List<String>? selectedOptions;

  const ChoiceQuestionData({
    required this.isMultipleChoice,
    required this.options,
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

  const ChoiceQuestionData.common({int index = 0})
      : this(
          // TODO(dev): to localization somehow
          isMultipleChoice: false,
          options: const ['First option', 'Second option', 'Third option'],
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

  @override
  ChoiceQuestionData copyWith({
    bool? isMultipleChoice,
    List<String>? options,
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
    List<String>? selectedOptions,
  }) {
    return ChoiceQuestionData(
      isMultipleChoice: isMultipleChoice ?? this.isMultipleChoice,
      options: options ?? this.options,
      index: index ?? this.index,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isSkip: isSkip ?? this.isSkip,
      selectedOptions: selectedOptions ?? this.selectedOptions,
    );
  }

  @override
  ChoiceQuestionTheme? get theme => const ChoiceQuestionTheme.common();

  @override
  String get type => QuestionTypes.choice;

  @override
  Map<String, dynamic> toJson() => {
        'index': index,
        'title': title,
        'subtitle': subtitle,
        'type': type,
        'isSkip': isSkip,
        'content': content,
        'payload': {
          'isMultipleChoice': isMultipleChoice,
          'options': options,
          'selectedOptions': selectedOptions,
        }
      };

  factory ChoiceQuestionData.fromJson(Map<String, dynamic> json) {
    final payload = json['payload'] as Map<String, dynamic>;
    return ChoiceQuestionData(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      isMultipleChoice: payload['isMultipleChoice'],
      options: (payload['options'] as List<dynamic>).cast<String>(),
      selectedOptions: payload['selectedOptions'] != null
          ? (payload['selectedOptions'] as List<dynamic>).cast<String>()
          : null,
    );
  }

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
      ];
}

import 'package:survey_core/src/domain/entities/constants/question_types.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/choice_question_theme.dart';

class ChoiceQuestionData extends QuestionData<ChoiceQuestionTheme> {
  final bool isMultipleChoice;
  final List<String> options;
  final List<String>? selectedOptions;

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

  @override
  ChoiceQuestionTheme? get theme => const ChoiceQuestionTheme.common();

  @override
  String get type => QuestionTypes.choice;

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
        },
      };
}

import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/choice_question_theme.dart';

class ChoiceQuestionData extends QuestionData<ChoiceQuestionTheme> {
  final bool isMultipleChoice;
  final List<String> options;
  final List<String>? selectedOptions;
  final String? content;

  const ChoiceQuestionData({
    required this.isMultipleChoice,
    required this.options,
    this.selectedOptions,
    required super.id,
    required super.title,
    required super.subtitle,
    required super.typeQuestion,
    required super.isSkip,
    super.info,
    this.content,
  }) : assert(
          selectedOptions == null ||
              (!isMultipleChoice && selectedOptions.length == 1) ||
              (isMultipleChoice && selectedOptions.length != 0),
        );

  @override
  ChoiceQuestionTheme? get theme => const ChoiceQuestionTheme.common();

  @override
  String get type => 'Choice';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'typeQuestion': typeQuestion,
        'isSkip': isSkip,
        'info': info,
        'payload': {
          'content': content,
          'isMultipleChoice': isMultipleChoice,
          'options': options,
          'selectedOption': selectedOptions,
        }
      };

  static ChoiceQuestionData fromJson(Map<String, dynamic> json) {
    final payload = json['payload'];
    return ChoiceQuestionData(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      typeQuestion: json['typeQuestion'],
      isSkip: json['isSkip'],
      info: json['info'],
      isMultipleChoice: payload['isMultipleChoice'],
      options: payload['options'],
      content: payload['content'],
      selectedOptions: payload['selectedOption'],
    );
  }
}

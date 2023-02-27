// ignore_for_file: avoid_dynamic_calls

import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/choice_question_theme.dart';

class ChoiceQuestionData extends QuestionData<ChoiceQuestionTheme> {
  final bool isMultipleChoice;
  final List<String> options;
  final String? content;

  const ChoiceQuestionData({
    required this.isMultipleChoice,
    required this.options,
    required super.id,
    required super.title,
    required super.subtitle,
    required super.typeQuestion,
    required super.isSkip,
    super.info,
    this.content,
  });

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
        }
      };

  factory ChoiceQuestionData.fromJson(Map<String, dynamic> json) {
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
    );
  }
}

import 'package:survey_core/src/domain/entities/constants/question_types.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/choice_question_theme.dart';

class ChoiceQuestionData extends QuestionData<ChoiceQuestionTheme> {
  final bool isMultipleChoice;
  final List<String> options;

  ChoiceQuestionData({
    required this.isMultipleChoice,
    required this.options,
    required super.index,
    required super.title,
    required super.subtitle,
    required super.isSkip,
    super.content,
  });

  ChoiceQuestionData.common({int index = 0})
      : this(
          //TODO: to localization somehow
          isMultipleChoice: false,
          options: ['First option', 'Second option', 'Third option'],
          title: 'Title',
          subtitle: '',
          isSkip: false,
          content:
              'You may simply need a single, brief answer without discussion. Other times, you may want to talk through a scenario, evaluate how well a group is learning new material or solicit feedback. The types of questions you ask directly impact the type of answer you receive.',
          index: index,
        );

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
        }
      };

  static ChoiceQuestionData fromJson(Map<String, dynamic> json) {
    final payload = json['payload'];
    return ChoiceQuestionData(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      isMultipleChoice: payload['isMultipleChoice'],
      options: payload['options'],
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
      ];
}

import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/input_question_theme.dart';
import 'package:survey_core/src/domain/entities/validator/input_validator.dart';

class InputQuestionData extends QuestionData<InputQuestionTheme> {
  final InputValidator validator;
  final String? hintText;

  const InputQuestionData({
    required this.validator,
    required super.index,
    required super.title,
    required super.subtitle,
    required super.isSkip,
    super.content,
    this.hintText,
  });

  InputQuestionData.common({int index = 0})
      : this(
          // TODO(dev): to localization somehow
          validator: NumberValidator(),
          index: index,
          title: 'Why is asking the right type of questions important?',
          subtitle: '',
          isSkip: false,
          content: 'Doing so can help you gather the information most '
              'relevant and useful to you',
        );

  @override
  InputQuestionTheme? get theme => const InputQuestionTheme.common();

  @override
  String get type => 'Input';

  @override
  Map<String, dynamic> toJson() => {
        'index': index,
        'title': title,
        'subtitle': subtitle,
        'type': type,
        'isSkip': isSkip,
        'content': content,
        'payload': {
          ...JsonValidator.toJson(validator),
          'hintText': hintText,
        }
      };

  factory InputQuestionData.fromJson(Map<String, dynamic> json) {
    final payload = json['payload'] as Map<String, dynamic>;
    return InputQuestionData(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      validator: JsonValidator.fromJson(payload),
      hintText: payload['hintText'],
    );
  }

  @override
  // TODO(dev): implement props
  List<Object?> get props => [
        validator,
        index,
        title,
        subtitle,
        isSkip,
        content,
        hintText,
      ];
}

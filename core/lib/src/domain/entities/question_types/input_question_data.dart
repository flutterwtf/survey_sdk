import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/input_question_theme.dart';
import 'package:survey_core/src/domain/entities/validator/input_validator.dart';

class InputQuestionData extends QuestionData<InputQuestionTheme> {
  final InputValidator validator;
  final String? hintText;
  final int value;

  const InputQuestionData({
    required this.validator,
    required this.value,
    required super.id,
    required super.title,
    required super.subtitle,
    required super.typeQuestion,
    required super.isSkip,
    super.info,
    this.hintText,
  });

  @override
  InputQuestionTheme? get theme => const InputQuestionTheme.common();

  @override
  String get type => 'Input';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'typeQuestion': typeQuestion,
        'isSkip': isSkip,
        'info': info,
        'payload': {
          ...JsonValidator.toJson(validator),
          'value': value,
          'hintText': hintText,
        }
      };

  static InputQuestionData fromJson(Map<String, dynamic> json) {
    final payload = json['payload'];
    return InputQuestionData(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      typeQuestion: json['typeQuestion'],
      isSkip: json['isSkip'],
      info: json['info'],
      validator: JsonValidator.fromJson(payload),
      value: payload['value'],
      hintText: payload['hintText'],
    );
  }
}

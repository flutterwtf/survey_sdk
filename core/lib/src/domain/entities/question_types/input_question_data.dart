import 'package:survey_core/src/domain/entities/constants/question_data_common.dart';
import 'package:survey_core/src/domain/entities/constants/question_types.dart';
import 'package:survey_core/src/domain/entities/input_validator.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/input_question_theme.dart';

enum InputType {
  text,
  number,
  date,
  email,
  password,
  phone;
}

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
          validator: InputValidator.number(),
          index: index,
          title: QuestionDataCommon.inputQuestionTitle,
          subtitle: QuestionDataCommon.choiceQuestionSubtitle,
          isSkip: false,
          content: QuestionDataCommon.inputQuestionContent,
        );

  @override
  InputQuestionData copyWith({
    InputValidator? validator,
    String? hintText,
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
  }) {
    return InputQuestionData(
      validator: validator ?? this.validator,
      hintText: hintText,
      index: index ?? this.index,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isSkip: isSkip ?? this.isSkip,
    );
  }

  @override
  InputQuestionTheme? get theme => const InputQuestionTheme.common();

  @override
  String get type => QuestionTypes.input;

  @override
  Map<String, dynamic> toJson() => {
        'index': index,
        'title': title,
        'subtitle': subtitle,
        'type': type,
        'isSkip': isSkip,
        'content': content,
        'payload': {
          ...validator.toJson(),
          'hintText': hintText,
        },
      };

  factory InputQuestionData.fromJson(Map<String, dynamic> json) {
    final payload = json['payload'] as Map<String, dynamic>;
    return InputQuestionData(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      validator: InputValidator.fromJson(payload),
      hintText: payload['hintText'],
    );
  }

  @override
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

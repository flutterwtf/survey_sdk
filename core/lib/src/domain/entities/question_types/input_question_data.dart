import 'package:survey_core/src/domain/entities/constants/question_types.dart';
import 'package:survey_core/src/domain/entities/input_validator.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/input_question_theme.dart';

class InputQuestionData extends QuestionData<InputQuestionTheme> {
  final InputValidator validator;
  final String? hintText;
  final String? buttonText;
  final InputQuestionTheme? theme;

  @override
  String get type => QuestionTypes.input;

  const InputQuestionData({
    required this.validator,
    required this.theme,
    required super.index,
    required super.title,
    required super.subtitle,
    required super.isSkip,
    super.content,
    this.hintText,
    this.buttonText,
  });

  InputQuestionData.common({int index = 0})
      : this(
          // TODO(dev): to localization somehow
          validator: InputValidator.number(),
          theme: null,
          index: index,
          title: 'Why is asking the right type of questions important?',
          subtitle: '',
          isSkip: false,
          content: 'Doing so can help you gather the information most '
              'relevant and useful to you',
        );

  @override
  InputQuestionData copyWith({
    InputValidator? validator,
    String? hintText,
    int? index,
    String? title,
    String? subtitle,
    String? content,
    String? buttonText,
    bool? isSkip,
    InputQuestionTheme? theme,
  }) {
    return InputQuestionData(
      validator: validator ?? this.validator,
      hintText: hintText ?? this.hintText,
      index: index ?? this.index,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isSkip: isSkip ?? this.isSkip,
      buttonText: buttonText ?? this.buttonText,
      theme: theme ?? this.theme,
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
        'theme': theme?.toJson(),
        'payload': {
          ...validator.toJson(),
          'hintText': hintText,
          'buttonText': buttonText,
        },
      };

  factory InputQuestionData.fromJson(Map<String, dynamic> json) {
    final payload = json['payload'];
    final theme = json['theme'];
    return InputQuestionData(
      theme: theme != null ? InputQuestionTheme.fromJson(theme) : null,
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      validator: InputValidator.fromJson(payload),
      hintText: payload['hintText'],
      buttonText: payload['buttonText'],
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
        buttonText,
        theme,
      ];
}

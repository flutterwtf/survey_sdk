import 'package:survey_sdk/src/domain/entities/constants/question_types.dart';
import 'package:survey_sdk/src/domain/entities/input_validator.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/domain/entities/themes/input_question_theme.dart';

/// The data class for an input question
class InputQuestionData extends QuestionData<InputQuestionTheme> {
  /// Input validation rules.
  final InputValidator validator;

  /// Text to display as a hint in the input field
  final String? hintText;
  final InputQuestionTheme? theme;

  @override
  String get type => QuestionTypes.input;

  @override
  List<Object?> get props => [
        validator,
        index,
        title,
        subtitle,
        isSkip,
        content,
        hintText,
        theme,
        secondaryButtonText,
        primaryButtonText,
      ];

  const InputQuestionData({
    required this.validator,
    required this.theme,
    required super.index,
    required super.title,
    required super.subtitle,
    required super.isSkip,
    required super.secondaryButtonText,
    required super.primaryButtonText,
    super.content,
    this.hintText,
  });

  InputQuestionData.common({int index = 0})
      : this(
          // TODO(dev): to localization somehow
          validator: InputValidator.number(),
          theme: const InputQuestionTheme.common(),
          index: index,
          title: 'Why is asking the right type of questions important?',
          subtitle: '',
          isSkip: false,
          content: 'Doing so can help you gather the information most '
              'relevant and useful to you',
          primaryButtonText: 'NEXT',
          secondaryButtonText: 'SKIP',
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
    InputQuestionTheme? theme,
    String? secondaryButtonText,
    String? primaryButtonText,
  }) {
    return InputQuestionData(
      validator: validator ?? this.validator,
      hintText: hintText ?? this.hintText,
      index: index ?? this.index,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      content: content ?? this.content,
      isSkip: isSkip ?? this.isSkip,
      primaryButtonText: primaryButtonText ?? this.primaryButtonText,
      theme: theme ?? this.theme,
      secondaryButtonText: secondaryButtonText ?? this.secondaryButtonText,
    );
  }
}

import 'package:survey_sdk/src/domain/entities/actions/survey_action.dart';
import 'package:survey_sdk/src/domain/entities/constants/question_types.dart';
import 'package:survey_sdk/src/domain/entities/input_validator.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/domain/entities/themes/input_question_theme.dart';

/// Data class representing an input question.
///
/// The [InputQuestionData] class extends the [QuestionData] class and provides
/// additional properties specific to input questions.
class InputQuestionData extends QuestionData<InputQuestionTheme> {
  /// Input validation rules.
  /// Default value is [InputValidator.number()].
  final InputValidator validator;

  /// Text to display as a hint in the input field.
  /// Default value is [```null```].
  final String? hintText;

  /// The theme applied to the input question.
  /// Default value is [InputQuestionTheme.common()].
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
        mainButtonAction,
        secondaryButtonAction,
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
    super.mainButtonAction,
    super.secondaryButtonAction,
    super.content,
    this.hintText,
  });

  /// Creates a common instance of [InputQuestionData].
  ///
  /// The [InputQuestionData.common] constructor is a convenience constructor
  /// that creates a common instance of [InputQuestionData] with predefined
  /// values.
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
    SurveyAction? mainButtonAction,
    SurveyAction? secondaryButtonAction,
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
      mainButtonAction: mainButtonAction ?? this.mainButtonAction,
      secondaryButtonAction:
          secondaryButtonAction ?? this.secondaryButtonAction,
    );
  }
}

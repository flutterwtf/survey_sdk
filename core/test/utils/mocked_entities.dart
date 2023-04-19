import 'package:survey_core/src/domain/entities/input_validator.dart';
import 'package:survey_core/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';
import 'package:survey_core/src/domain/entities/themes/choice_question_theme.dart';
import 'package:survey_core/src/domain/entities/themes/common_theme.dart';
import 'package:survey_core/src/domain/entities/themes/input_question_theme.dart';
import 'package:survey_core/src/domain/entities/themes/intro_question_theme.dart';
import 'package:survey_core/src/domain/entities/themes/slider_question_theme.dart';

abstract class MockedEntities {
  static const choice1 = ChoiceQuestionData(
    isMultipleChoice: true,
    options: ['option 1', 'option 2', 'option 3'],
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: true,
    ruleType: RuleType.none,
    ruleValue: 0,
    theme: ChoiceQuestionTheme.common(),
  );

  static const choice2 = ChoiceQuestionData(
    isMultipleChoice: false,
    options: ['option 1', 'option 2'],
    index: 1,
    title: 'Another title',
    subtitle: 'Another subtitle',
    isSkip: false,
    content: 'content',
    ruleType: RuleType.none,
    ruleValue: 0,
    theme: ChoiceQuestionTheme.common(),
  );

  static const choice3 = ChoiceQuestionData(
    title: 'title',
    content: 'content',
    options: ['option', 'option', 'option'],
    isMultipleChoice: false,
    isSkip: false,
    index: 0,
    subtitle: '',
    ruleType: RuleType.none,
    ruleValue: 0,
    theme: ChoiceQuestionTheme.common(),
  );

  static final input1 = InputQuestionData(
    validator: InputValidator.text(),
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: false,
    buttonText: 'NEXT',
    theme: const InputQuestionTheme.common(),
  );

  static final input2 = InputQuestionData(
    validator: InputValidator.text(),
    index: 1,
    title: 'Another title',
    subtitle: 'Another subtitle',
    isSkip: true,
    hintText: 'hint',
    buttonText: 'NEXT',
    theme: const InputQuestionTheme.common(),
  );

  static const intro1 = IntroQuestionData(
    buttonText: 'Next',
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: false,
    theme: IntroQuestionTheme.common(),
  );

  static const intro2 = IntroQuestionData(
    buttonText: 'Next',
    index: 1,
    title: 'Another title',
    subtitle: 'Another subtitle',
    isSkip: true,
    content: 'content',
    theme: IntroQuestionTheme.common(),
  );

  static const slider1 = SliderQuestionData(
    minValue: 0,
    maxValue: 10,
    initialValue: 1,
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: false,
    divisions: 0,
    theme: SliderQuestionTheme.common(),
  );

  static const slider2 = SliderQuestionData(
    minValue: 10,
    maxValue: 100,
    initialValue: 50,
    index: 1,
    title: 'Another title',
    subtitle: 'Another subtitle',
    isSkip: true,
    divisions: 0,
    theme: SliderQuestionTheme.common(),
  );

  static final data1 = SurveyData(
    questions: [
      intro1,
      choice1,
      choice2,
    ],
    commonTheme: CommonTheme(
      slider: const SliderQuestionData.common(),
      choice: const ChoiceQuestionData.common(),
      input: InputQuestionData.common(),
      intro: const IntroQuestionData.common(),
    ),
  );

  static final data2 = SurveyData(
    questions: [
      input1,
    ],
    commonTheme: CommonTheme(
      slider: const SliderQuestionData.common(),
      input: InputQuestionData.common(),
      choice: const ChoiceQuestionData.common(),
      intro: const IntroQuestionData.common(),
    ),
  );
}

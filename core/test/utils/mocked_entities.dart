import 'package:survey_sdk/src/domain/entities/input_validator.dart';
import 'package:survey_sdk/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/end_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/info_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_sdk/src/domain/entities/survey_data.dart';
import 'package:survey_sdk/src/domain/entities/themes/choice_question_theme.dart';
import 'package:survey_sdk/src/domain/entities/themes/common_theme.dart';
import 'package:survey_sdk/src/domain/entities/themes/end_question_theme.dart';
import 'package:survey_sdk/src/domain/entities/themes/info_question_theme.dart';
import 'package:survey_sdk/src/domain/entities/themes/input_question_theme.dart';
import 'package:survey_sdk/src/domain/entities/themes/slider_question_theme.dart';

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
    secondaryButtonText: 'SKIP',
    primaryButtonText: 'Next',
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
    secondaryButtonText: 'SKIP',
    primaryButtonText: 'Next',
  );

  static const choice4 = ChoiceQuestionData(
    isMultipleChoice: true,
    options: ['option 1', 'option 2', 'option 3'],
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: false,
    ruleType: RuleType.none,
    ruleValue: 0,
    theme: ChoiceQuestionTheme.common(),
    secondaryButtonText: 'SKIP',
    primaryButtonText: 'NEXT',
  );

  static final input1 = InputQuestionData(
    validator: InputValidator.text(),
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: false,
    primaryButtonText: 'NEXT',
    theme: const InputQuestionTheme.common(),
    secondaryButtonText: 'SKIP',
  );

  static final input2 = InputQuestionData(
    validator: InputValidator.text(),
    index: 1,
    title: 'Another title',
    subtitle: 'Another subtitle',
    isSkip: true,
    hintText: 'hint',
    primaryButtonText: 'NEXT',
    theme: const InputQuestionTheme.common(),
    secondaryButtonText: 'SKIP',
  );

  static final input3 = InputQuestionData(
    validator: InputValidator.number(),
    index: 1,
    title: 'input',
    subtitle: 'subtitle',
    isSkip: true,
    hintText: 'hint',
    primaryButtonText: 'NEXT',
    secondaryButtonText: 'EXIT',
    theme: const InputQuestionTheme.common().copyWith(
      inputType: InputType.number,
    ),
  );

  static const info1 = InfoQuestionData(
    primaryButtonText: 'Next',
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: false,
    theme: InfoQuestionTheme.common(),
    secondaryButtonText: 'SKIP',
  );

  static const info2 = InfoQuestionData(
    index: 1,
    title: 'Another title',
    subtitle: 'Another subtitle',
    isSkip: true,
    content: 'content',
    theme: InfoQuestionTheme.common(),
    secondaryButtonText: 'SKIP',
    primaryButtonText: 'Next',
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
    secondaryButtonText: 'SKIP',
    primaryButtonText: 'Next',
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
    secondaryButtonText: 'SKIP',
    primaryButtonText: 'Next',
  );

  static const slider3 = SliderQuestionData(
    minValue: 0,
    maxValue: 10,
    initialValue: 1,
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: false,
    divisions: 12,
    theme: SliderQuestionTheme.common(),
    primaryButtonText: 'NEXT',
    secondaryButtonText: 'EXIT',
  );

  static const endQuestion = EndQuestionData(
      primaryButtonText: 'NEXT',
      title: 'title',
      index: 0,
      subtitle: 'subtitle',
      isSkip: false,
      theme: EndQuestionTheme.common(),
      secondaryButtonText: 'Skip',
    );

  static final data1 = SurveyData(
    questions: [
      info1.copyWith(index: 1),
      choice1.copyWith(index: 2),
      choice2.copyWith(index: 3),
      slider1.copyWith(index: 4),
    ],
    endQuestion: endQuestion.copyWith(index: 5),
    commonTheme: _commonTheme,
  );

  static final data2 = data1.copyWith(
    questions: [info1, input1, choice1, slider1],
    commonTheme: _commonTheme.copyWith(
      slider: const SliderQuestionData.common().copyWith(
        theme: const SliderQuestionTheme.common(),
      ),
      choice: const ChoiceQuestionData.common()
          .copyWith(theme: const ChoiceQuestionTheme.common()),
      input: InputQuestionData.common().copyWith(
        theme: const InputQuestionTheme.common(),
      ),
      info: const InfoQuestionData.common()
          .copyWith(theme: const InfoQuestionTheme.common()),
    ),
  );

  static final _commonTheme = CommonTheme(
    slider: const SliderQuestionData.common(),
    choice: const ChoiceQuestionData.common(),
    input: InputQuestionData.common(),
    info: const InfoQuestionData.common(),
    end: const EndQuestionData.common(),
  );
}

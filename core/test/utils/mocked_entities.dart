import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';
import 'package:survey_core/src/domain/entities/themes/common_theme.dart';
import 'package:survey_core/src/domain/entities/themes/text_field_theme_data.dart';
import 'package:survey_core/src/domain/entities/validator/input_validator.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';

abstract class MockedQuestions {
  static final choice1 = ChoiceQuestionData(
    isMultipleChoice: true,
    options: ['option 1', 'option 2', 'option 3'],
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: true,
  );

  static final choice2 = ChoiceQuestionData(
    isMultipleChoice: false,
    options: ['option 1', 'option 2'],
    index: 1,
    title: 'Another title',
    subtitle: 'Another subtitle',
    isSkip: false,
    content: 'content',
  );

  final input1 = InputQuestionData(
    validator: DefaultValidator(),
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: false,
  );

  final input2 = InputQuestionData(
    validator: NumberValidator(),
    index: 1,
    title: 'Another title',
    subtitle: 'Another subtitle',
    isSkip: true,
    hintText: 'hint',
  );

  static final intro1 = IntroQuestionData(
    mainButtonTitle: 'Next',
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: false,
  );

  static final intro2 = IntroQuestionData(
    mainButtonTitle: 'Next',
    index: 1,
    title: 'Another title',
    subtitle: 'Another subtitle',
    isSkip: true,
    content: 'content',
  );

  static final slider1 = SliderQuestionData(
    minValue: 0,
    maxValue: 10,
    initialValue: 1,
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: false,
  );

  static final slider2 = SliderQuestionData(
    minValue: 10,
    maxValue: 100,
    initialValue: 50,
    index: 1,
    title: 'Another title',
    subtitle: 'Another subtitle',
    isSkip: true,
  );
}

abstract class MockedSurveyData {
  static final data1 = SurveyData(
    questions: [
      MockedQuestions.intro1,
      MockedQuestions.choice1,
      MockedQuestions.choice2,
    ],
    commonTheme: CommonTheme(
      textFieldThemeData: const TextFieldThemeData.common(),
      sliderThemeData: const SliderThemeData(),
    ),
  );
}

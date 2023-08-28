import 'package:flutter/material.dart';
import 'package:survey_sdk/survey_sdk.dart';

const _titleSize = 18.0;
const _subtitleSize = 15.0;
const _buttonTextSize = 14.0;
const _buttonRadius = 12.0;
const _horizontalPadding = 15.0;
const _verticalPadding = 15.0;
const _thumbRadius = 14.0;
const _thickness = 10.0;

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
    theme: ChoiceQuestionTheme(
      activeColor: SurveyColors.grey,
      inactiveColor: SurveyColors.grey,
      fill: SurveyColors.grey,
      titleColor: SurveyColors.grey,
      titleSize: _titleSize,
      subtitleColor: SurveyColors.grey,
      subtitleSize: _subtitleSize,
      primaryButtonFill: SurveyColors.grey,
      primaryButtonTextColor: SurveyColors.grey,
      primaryButtonTextSize: _buttonTextSize,
      primaryButtonRadius: _buttonRadius,
      secondaryButtonFill: SurveyColors.grey,
      secondaryButtonTextColor: SurveyColors.grey,
      secondaryButtonTextSize: _buttonTextSize,
      secondaryButtonRadius: _buttonRadius,
    ),
    secondaryButtonText: 'SKIP',
    primaryButtonText: 'Next',
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
    validator: InputValidator.number(),
    index: 1,
    title: 'Another title',
    subtitle: 'Another subtitle',
    isSkip: true,
    hintText: 'hint',
    primaryButtonText: 'NEXT',
    theme: const InputQuestionTheme(
      inputFill: Colors.blueAccent,
      borderColor: Colors.blueAccent,
      borderWidth: 1,
      lines: 1,
      hintColor: SurveyColors.textLightGrey,
      hintSize: SurveyFonts.sizeL,
      textColor: SurveyColors.black,
      textSize: SurveyFonts.sizeL,
      inputType: InputType.number,
      errorText: 'Error',
      isMultiline: false,
      fill: Colors.blueAccent,
      titleColor: Colors.blueAccent,
      titleSize: _titleSize,
      subtitleColor: Colors.blueAccent,
      subtitleSize: _subtitleSize,
      primaryButtonFill: Colors.blueAccent,
      primaryButtonTextColor: Colors.blueAccent,
      primaryButtonTextSize: _buttonTextSize,
      primaryButtonRadius: _buttonRadius,
      secondaryButtonFill: Colors.blueAccent,
      secondaryButtonTextColor: Colors.blueAccent,
      secondaryButtonTextSize: _buttonTextSize,
      secondaryButtonRadius: _buttonRadius,
      horizontalPadding: _horizontalPadding,
      verticalPadding: _verticalPadding,
    ),
    secondaryButtonText: 'SKIP',
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
    theme: InfoQuestionTheme(
      fill: SurveyColors.grey,
      titleColor: SurveyColors.grey,
      titleSize: SurveyFonts.sizeL,
      subtitleColor: SurveyColors.grey,
      subtitleSize: SurveyFonts.sizeS,
      primaryButtonFill: SurveyColors.grey,
      primaryButtonTextColor: SurveyColors.grey,
      primaryButtonTextSize: SurveyFonts.sizeS,
      primaryButtonRadius: SurveyDimensions.circularRadiusS,
      secondaryButtonFill: SurveyColors.grey,
      secondaryButtonTextColor: SurveyColors.grey,
      secondaryButtonTextSize: SurveyFonts.sizeS,
      secondaryButtonRadius: SurveyDimensions.circularRadiusS,
    ),
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
    theme: SliderQuestionTheme(
      activeColor: Colors.grey,
      inactiveColor: Colors.grey,
      thumbColor: Colors.grey,
      thumbRadius: _thumbRadius,
      thickness: _thickness,
      fill: Colors.grey,
      titleColor: Colors.grey,
      titleSize: _titleSize,
      subtitleColor: Colors.grey,
      subtitleSize: _subtitleSize,
      primaryButtonFill: Colors.grey,
      primaryButtonTextColor: Colors.grey,
      primaryButtonTextSize: _buttonTextSize,
      primaryButtonRadius: _buttonRadius,
      secondaryButtonFill: Colors.grey,
      secondaryButtonTextColor: Colors.grey,
      secondaryButtonTextSize: _buttonTextSize,
      secondaryButtonRadius: _buttonRadius,
    ),
    secondaryButtonText: 'SKIP',
    primaryButtonText: 'Next',
  );

  static final data1 = SurveyData(
    questions: [
      info1.copyWith(index: 1),
      choice1.copyWith(index: 2),
      input1.copyWith(index: 3),
      slider1.copyWith(index: 4),
    ],
    commonTheme: _commonTheme,
  );

  static final _commonTheme = CommonTheme(
    slider: const SliderQuestionData.common(),
    choice: const ChoiceQuestionData.common(),
    input: InputQuestionData.common(),
    info: const InfoQuestionData.common(),
  );
}

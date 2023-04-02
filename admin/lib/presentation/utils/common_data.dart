import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_core/survey_core.dart';

class CommonData {
  final BuildContext context;
  static const _minValue = 0;
  static const _maxValue = 10;
  static const _initialValue = 5;
  static const _firstIndex = 1;
  static const _secondIndex = 2;
  static const _dividers = 10;

  CommonTheme get commonTheme {
    return CommonTheme(
      slider: slider(),
      intro: intro(),
      input: input(),
      choice: choice(),
    );
  }

  SurveyData get surveyData {
    return SurveyData(
      questions: [
        intro(index: _firstIndex),
        input(index: _secondIndex),
        choice(index: 3),
        slider(index: 4),
      ],
      commonTheme: commonTheme,
    );
  }

  const CommonData(this.context);

  IntroQuestionData intro({int index = 0}) {
    return IntroQuestionData(
      buttonText: context.localization.next,
      title: context.localization.intro,
      index: index,
      subtitle: context.localization.empty_subtitle,
      isSkip: false,
      content: context.localization.question_content,
      theme: const IntroQuestionTheme.common(),
    );
  }

  InputQuestionData input({int index = 0}) {
    return InputQuestionData(
      validator: InputValidator.number(),
      index: index,
      title: context.localization.input,
      subtitle: context.localization.empty_subtitle,
      isSkip: false,
      content: context.localization.question_content,
      theme: const InputQuestionTheme.common(),
    );
  }

  ChoiceQuestionData choice({int index = 0}) {
    return ChoiceQuestionData(
      isMultipleChoice: false,
      options: [
        context.localization.first_option,
        context.localization.second_option,
        context.localization.third_option,
      ],
      title: context.localization.choice,
      subtitle: context.localization.empty_subtitle,
      isSkip: false,
      content: context.localization.question_content,
      index: index,
      ruleType: RuleType.none,
      ruleValue: 0,
      theme: const ChoiceQuestionTheme.common(),
    );
  }

  SliderQuestionData slider({int index = 0}) {
    return SliderQuestionData(
      minValue: _minValue,
      maxValue: _maxValue,
      initialValue: _initialValue,
      title: context.localization.slider,
      index: index,
      subtitle: context.localization.empty_subtitle,
      isSkip: false,
      content: context.localization.question_content,
      divisions: _dividers,
      theme: const SliderQuestionTheme.common(),
    );
  }
}

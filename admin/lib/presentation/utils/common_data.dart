import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_sdk/survey_sdk.dart';

class CommonData {
  final BuildContext context;
  static const _minValue = 0;
  static const _maxValue = 10;
  static const _initialValue = 5;
  static const _firstIndex = 1;
  static const _secondIndex = 2;
  static const _thirdIndex = 3;
  static const _fourthIndex = 4;
  static const _fivethIndex = 5;
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
        choice(index: _thirdIndex),
        slider(index: _fourthIndex),
      ],
      endPage: endPage(index: _fivethIndex),
      commonTheme: commonTheme,
    );
  }

  const CommonData(this.context);

  InfoQuestionData intro({int index = 0}) {
    return InfoQuestionData(
      primaryButtonText: context.localization.next,
      title: context.localization.intro,
      index: index,
      subtitle: context.localization.emptySubtitle,
      isSkip: false,
      content: context.localization.questionContent,
      theme: const InfoQuestionTheme.common(),
      secondaryButtonText: context.localization.skip,
    );
  }

  InputQuestionData input({int index = 0}) {
    return InputQuestionData(
      validator: InputValidator.text(),
      index: index,
      title: context.localization.input,
      subtitle: context.localization.emptySubtitle,
      isSkip: false,
      content: context.localization.questionContent,
      hintText: context.localization.inputHintText,
      theme: const InputQuestionTheme.common(),
      primaryButtonText: context.localization.next,
      secondaryButtonText: context.localization.skip,
    );
  }

  ChoiceQuestionData choice({int index = 0}) {
    return ChoiceQuestionData(
      isMultipleChoice: false,
      options: [
        context.localization.firstOption,
        context.localization.secondOption,
        context.localization.thirdOption,
      ],
      title: context.localization.choice,
      subtitle: context.localization.emptySubtitle,
      isSkip: false,
      content: context.localization.questionContent,
      index: index,
      ruleType: RuleType.none,
      ruleValue: 0,
      theme: const ChoiceQuestionTheme.common(),
      primaryButtonText: context.localization.next,
      secondaryButtonText: context.localization.skip,
    );
  }

  SliderQuestionData slider({int index = 0}) {
    return SliderQuestionData(
      minValue: _minValue,
      maxValue: _maxValue,
      initialValue: _initialValue,
      title: context.localization.slider,
      index: index,
      subtitle: context.localization.emptySubtitle,
      isSkip: false,
      content: context.localization.questionContent,
      divisions: _dividers,
      theme: const SliderQuestionTheme.common(),
      secondaryButtonText: context.localization.skip,
      primaryButtonText: context.localization.next,
    );
  }

  InfoQuestionData endPage({int index = 0}) {
    return InfoQuestionData(
      primaryButtonText: context.localization.next,
      title: context.localization.end,
      index: index,
      subtitle: context.localization.surveyCompleted,
      isSkip: false,
      content: context.localization.emptyContent,
      theme: const InfoQuestionTheme.common(),
      secondaryButtonText: context.localization.skip,
    );
  }
}

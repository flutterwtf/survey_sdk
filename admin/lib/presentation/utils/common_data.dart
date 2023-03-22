import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/app_colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_core/survey_core.dart';

class CommonData {
  final BuildContext context;
  static const _minValue = 0;
  static const _maxValue = 10;
  static const _initialValue = 5;
  static const _firstIndex = 1;
  static const _secondIndex = 2;

  CommonTheme get commonTheme {
    return CommonTheme(
      textFieldThemeData: const TextFieldThemeData(
        fillCommonColor: AppColors.white,
        fillInputColor: AppColors.white,
        borderColor: AppColors.black,
        borderWidth: AppDimensions.circularRadiusXS,
        verticalPadding: AppDimensions.marginM,
        horizontalPadding: AppDimensions.marginM,
        hintColor: AppColors.textGrey,
        hintSize: AppDimensions.marginM,
        textColor: AppColors.black,
        textSize: AppDimensions.marginM,
        titleColor: AppColors.black,
        titleSize: AppDimensions.marginM,
        subtitleColor: AppColors.black,
        subtitleSize: AppDimensions.marginS,
        buttonTextSize: AppDimensions.marginS,
        buttonColor: AppColors.black,
        buttonTextColor: AppColors.white,
      ),
      sliderThemeData: Theme.of(context).sliderTheme,
    );
  }

  SurveyData get surveyData {
    return SurveyData(
      questions: [
        intro(index: _firstIndex),
        input(index: _secondIndex),
      ],
      commonTheme: commonTheme,
    );
  }

  const CommonData(this.context);

  IntroQuestionData intro({int index = 0}) {
    return IntroQuestionData(
      mainButtonTitle: context.localization.next,
      title: context.localization.intro,
      index: index,
      subtitle: context.localization.empty_subtitle,
      isSkip: false,
      content: context.localization.question_content,
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
    );
  }
}

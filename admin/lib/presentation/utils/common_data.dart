import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_core/survey_core.dart';

abstract class CommonData {
  static const _minValue = 0;
  static const _maxValue = 10;
  static const _initialValue = 5;
  static const _firstIndex = 1;
  static const _secondIndex = 2;

  static CommonTheme commonTheme({BuildContext? context}) {
    final sliderTheme = context != null
        ? Theme.of(context).sliderTheme
        : const SliderThemeData();
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
      sliderThemeData: sliderTheme,
    );
  }

  static SurveyData surveyData(BuildContext context) {
    return SurveyData(
      questions: [
        CommonData.intro(context: context, index: _firstIndex),
        CommonData.input(context: context, index: _secondIndex),
      ],
      commonTheme: commonTheme(context: context),
    );
  }

  static IntroQuestionData intro({
    required BuildContext context,
    int index = 0,
  }) {
    return IntroQuestionData(
      mainButtonTitle: context.localization.next,
      title: context.localization.intro,
      index: index,
      subtitle: context.localization.empty_subtitle,
      isSkip: false,
      content: context.localization.question_content,
    );
  }

  static InputQuestionData input({
    required BuildContext context,
    int index = 0,
  }) {
    return InputQuestionData(
      validator: InputValidator.number(),
      index: index,
      title: context.localization.input,
      subtitle: context.localization.empty_subtitle,
      isSkip: false,
      content: context.localization.question_content,
    );
  }

  static ChoiceQuestionData choice({
    required BuildContext context,
    int index = 0,
  }) {
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

  static SliderQuestionData slider({
    required BuildContext context,
    int index = 0,
  }) {
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

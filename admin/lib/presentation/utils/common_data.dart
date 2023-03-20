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

  static CommonTheme get commonTheme => CommonTheme(
        textFieldThemeData: const TextFieldThemeData(
          fillCommonColor: AppColors.black,
          fillInputColor: AppColors.white,
          borderColor: AppColors.black,
          borderWidth: AppDimensions.defaultBorderWidth,
          verticalPadding: AppDimensions.margin2XS,
          horizontalPadding: AppDimensions.margin2XS,
          hintColor: AppColors.textGrey,
          hintSize: AppFonts.sizeS,
          textColor: AppColors.black,
          textSize: AppFonts.sizeS,
          titleColor: AppColors.black,
          titleSize: AppFonts.sizeM,
          subtitleColor: AppColors.black,
          subtitleSize: AppFonts.sizeS,
          buttonTextSize: AppFonts.sizeS,
          buttonColor: AppColors.white,
          buttonTextColor: AppColors.black,
        ),
        sliderThemeData: const SliderThemeData(),
      );

  static SurveyData surveyData(BuildContext context) {
    return SurveyData(
      questions: [
        CommonData.intro(context: context, index: _firstIndex),
        CommonData.input(context: context, index: _secondIndex),
      ],
      commonTheme: commonTheme,
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

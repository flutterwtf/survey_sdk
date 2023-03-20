import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

  static Future<SurveyData> get surveyData async {
    return SurveyData(
      questions: [
        await CommonData.introQuestionData(index: _firstIndex),
        await CommonData.inputQuestionData(index: _secondIndex),
      ],
      commonTheme: commonTheme,
    );
  }

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

  static Future<IntroQuestionData> introQuestionData({int index = 0}) async {
    final localization =
        await AppLocalizations.delegate.load(const Locale('en'));
    return IntroQuestionData(
      mainButtonTitle: localization.next,
      title: localization.intro,
      index: index,
      subtitle: localization.empty_subtitle,
      isSkip: false,
      content: localization.question_content,
    );
  }

  static Future<InputQuestionData> inputQuestionData({int index = 0}) async {
    final localization =
        await AppLocalizations.delegate.load(const Locale('en'));
    return InputQuestionData(
      validator: InputValidator.number(),
      index: index,
      title: localization.input,
      subtitle: localization.empty_subtitle,
      isSkip: false,
      content: localization.question_content,
    );
  }

  static Future<ChoiceQuestionData> choiceQuestionData({int index = 0}) async {
    final localization =
        await AppLocalizations.delegate.load(const Locale('en'));
    return ChoiceQuestionData(
      isMultipleChoice: false,
      options: [
        localization.first_option,
        localization.second_option,
        localization.third_option,
      ],
      title: localization.choice,
      subtitle: localization.empty_subtitle,
      isSkip: false,
      content: localization.question_content,
      index: index,
    );
  }

  static Future<SliderQuestionData> sliderQuestionData({int index = 0}) async {
    final localization =
        await AppLocalizations.delegate.load(const Locale('en'));
    return SliderQuestionData(
      minValue: _minValue,
      maxValue: _maxValue,
      initialValue: _initialValue,
      title: localization.slider,
      index: index,
      subtitle: localization.empty_subtitle,
      isSkip: false,
      content: localization.question_content,
    );
  }
}

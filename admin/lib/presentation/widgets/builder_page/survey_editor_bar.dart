import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider_customization_panel.dart';
import 'package:survey_core/survey_core.dart';

class SurveyEditorBar extends StatelessWidget {
  final QuestionData? questionData;

  const SurveyEditorBar({
    super.key,
    required this.questionData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whitePrimaryBackground,
      width: AppDimensions.surveyEditorBarWidth,
      child: Builder(
        builder: (context) {
          switch (questionData?.type ?? '') {
            case 'Choice':
              return const ChoiceCustomizationPanel();
            case 'Input':
              return const InputCustomizationPanel();
            case 'Intro':
              return const IntroCustomizationPanel();
            case 'Slider':
              return const SliderCustomizationPanel();
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

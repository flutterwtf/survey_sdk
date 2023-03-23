import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/common_theme/common_theme_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro/intro_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_customization_panel.dart';
import 'package:survey_core/survey_core.dart';

// TODO(dev): will we use this?
class EditorBar extends StatelessWidget {
  final QuestionData? editableQuestion;

  const EditorBar({
    required this.editableQuestion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whitePrimaryBackground,
      width: AppDimensions.surveyEditorBarWidth,
      child: Builder(
        builder: (context) {
          final questionData = editableQuestion;
          if (questionData != null) {
            switch (questionData.type) {
              case QuestionTypes.choice:
                return ChoiceCustomizationPanel(
                  editableQuestion: questionData,
                  isMultipleChoice:
                      (questionData as ChoiceQuestionData).isMultipleChoice,
                );
              case QuestionTypes.input:
                return const InputCustomizationPanel();
              case QuestionTypes.intro:
                return const IntroCustomizationPanel();
              case QuestionTypes.slider:
                return const SliderCustomizationPanel();
              default:
                return const SizedBox.shrink();
            }
          } else {
            return const CommonThemeCustomizationPanel();
          }
        },
      ),
    );
  }
}
